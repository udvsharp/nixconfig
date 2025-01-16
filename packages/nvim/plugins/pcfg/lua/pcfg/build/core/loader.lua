local log = require('pcfg.log')

---@class Loader
---@field name string Loader name
---@field patterns string[] File patterns to detect project type
local Loader = {}
Loader.__index = Loader

---Validates loader configuration
---@param opts table Configuration table
---@return boolean is_valid
---@return string? error_message
local function validate(opts)
    if not opts.name then 
        log.error("Loader validation failed: name is required")
        return false, "Loader name is required" 
    end
    if not opts.patterns or #opts.patterns == 0 then
        log.error("Loader validation failed: patterns are required")
        return false, "At least one pattern is required"
    end
    return true
end

---Creates a new loader instance
---@param opts table Configuration table
---@field name string Loader name
---@field patterns string[] File patterns to detect
---@return Loader
function Loader:new(opts)
    local is_valid, error_message = validate(opts)
    assert(is_valid, error_message)

    log.debug(string.format("[%s] Creating new loader instance", opts.name))
    log.debug(string.format("[%s] Patterns: %s", opts.name, vim.inspect(opts.patterns)))

    local instance = setmetatable({}, self)
    instance.name = opts.name
    instance.patterns = opts.patterns
    return instance
end

---Checks if project supports this loader
---@param dir string Project directory
---@return boolean
function Loader:is_supported(dir)
    log.debug(string.format("[%s] Checking support for directory: %s", self.name, dir))
    
    for _, pattern in ipairs(self.patterns) do
        local glob_pattern = dir .. "/" .. pattern
        log.debug(string.format("[%s] Checking pattern: %s", self.name, glob_pattern))
        
        if vim.fn.glob(glob_pattern) ~= "" then
            log.info(string.format("[%s] Found matching pattern: %s", self.name, pattern))
            return true
        end
    end
    
    log.debug(string.format("[%s] No matching patterns found", self.name))
    return false
end

---Load targets from the specified directory
---@param dir string Project directory path
---@param register_fn fun(target: Target) Callback to register loaded target
---@return number Number of loaded targets
---@usage
--- loader:load_targets("/project/dir", function(target)
---     manager.register_target(target)
--- end)
function Loader:load_targets(dir, register_fn)
    error("load_targets must be implemented by derived loaders")
end
