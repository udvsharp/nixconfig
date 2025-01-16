local pcfg = require('pcfg.paths')
local log = require('pcfg.log')

local scan = require('plenary.scandir')
local path = require('plenary.path')

---@class Manager Build configuration manager
---@field tools table<string, BuildTool> Map of registered build tools
---@field loaders table<string, Loader> List of active loaders
---@field targets table<string, Target> Map of available targets
local Manager = {}

Manager.tools = {}
Manager.loaders = {}
Manager.targets = {}

---Register a new loader instance
---@param loader Loader Loader instance to register
function Manager.register_loader(loader)
    log.trace(string.format("Registering loader: %s", loader))
    table.insert(Manager.loaders, loader)
end

---Register a new target
---@param target Target Target instance to register
function Manager.register_target(target)
    log.trace(string.format("Registering target: %s", loader))
    Manager.targets[target.name] = target
end

---Enable build tool and load its components
---@param tool_name string Tool name (cmake, make, etc)
---@param opts? table Tool-specific options
---@usage
--- -- Enable CMake with default options
--- Manager.enable_tool("cmake")
--- -- Enable CMake with custom options
--- Manager.enable_tool("cmake", {})
function Manager.enable_tool(tool_name, opts)
    local tool_module_name = "pcfg.build.tool." .. tool_name

    log.debug(string.format("Loading build tool module: %s", tool_module_name))
    local ok, tool = pcall(require, tool_module_name)
    if not ok then
        log.error(string.format("Failed to load tool %s: %s", tool_name, tool))
        return
    end

    if tool.setup then
        tool.setup(opts or {})
    end

    log.trace(string.format("Registering tool %s: %s", tool_name, tool_module_name))
    Manager.tools[tool_name] = tool

    local loader_ok, loader = pcall(require, tool_module_name .. ".loader")
    if loader_ok then
        log.info(string.format("Loaded loader for tool: %s", tool_name))
        Manager.register_loader(loader)
    end
end

---Load targets from all registered loaders for the specified directory
---@param dir string Project directory path
---@return number Number of loaded targets
function Manager.load_targets(dir)
    log.debug(string.format("Loading targets from directory: %s", dir))
    
    if #Manager.loaders == 0 then
        log.warn("No loaders registered")
        return 0
    end

    local loaded_targets = 0
    for _, loader in ipairs(Manager.loaders) do
        log.debug(string.format("Checking loader: %s", loader.name))
        if loader:is_supported(dir) then
            log.trace(string.format("Loader %s supports directory, loading targets", loader.name))
            loader:load_targets(dir, function(target)
                Manager.register_target(target)
                loaded_targets = loaded_targets + 1
            end)
        end
    end

    log.info(string.format("Loaded %d targets", loaded_targets))
    return loaded_targets
end

---Initialize build system manager
---Called internally during plugin setup
function Manager.setup()
    log.debug("Initializing build system manager")
end

return Manager