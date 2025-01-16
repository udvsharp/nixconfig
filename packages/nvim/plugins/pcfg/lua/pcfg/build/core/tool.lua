local Job = require('plenary.job')
local log = require('pcfg.build.core.log')

---@class BuildTool
---@field name string Tool name
---@field supported_types TargetType[] List of supported target types
---@field default_config BuildConfig Default build configuration
local BuildTool = {}
BuildTool.__index = BuildTool

---@param opts {name: string, supported_types: TargetType[], default_config?: BuildConfig}
---@return boolean success
---@return string? error
local function validate(opts)
    if not opts.name then return false, "Tool name required" end
    if not opts.supported_types or #opts.supported_types == 0 then
        return false, "At least one supported target type required"
    end
    return true
end

---@param opts {name: string, supported_types: TargetType[], default_config?: BuildConfig}
function BuildTool:new(opts)
    local ok, err = validate(opts)
    assert(ok, err)

    local instance = setmetatable({}, self)
    instance.name = opts.name
    instance.supported_types = opts.supported_types
    instance.default_config = opts.default_config
    return instance
end

---@param target Target
---@param config BuildConfig
---@return table command
function BuildTool:get_build_command(target, config)
    error("get_build_command must be implemented by derived tools")
end

---@param target Target
---@param config BuildConfig
---@return table? command
function BuildTool:get_run_command(target, config)
    error("get_run_command must be implemented by derived tools")
end

---@param command table
---@param config BuildConfig
---@param callback? function that will be executed on successfull job finish
---@return boolean success
function BuildTool:execute(command, config, callback)
    log.debug(string.format("[%s] Executing command: %s", self.name, vim.inspect(command)))
    log.debug(string.format("[%s] Build directory: %s", self.name, config.build_dir))
    log.debug(string.format("[%s] Environment: %s", self.name, vim.inspect(config:get_env())))

    local job = Job:new({
        command = command[1],
        args = vim.list_slice(command, 2),
        cwd = config.build_dir,
        env = config:get_env(),
        on_stderr = function(_, data)
            log.warn(string.format("[%s] stderr: %s", self.name, data))
        end,
        on_exit = function(j, return_val)
            local result = j:result()
            if return_val == 0 then
                log.info(string.format("[%s] Command completed successfully", self.name))
                log.debug(string.format("[%s] Output: %s", self.name, vim.inspect(result)))
            else
                log.error(string.format("[%s] Command failed with code %d", self.name, return_val))
                log.error(string.format("[%s] Output: %s", self.name, vim.inspect(result)))
            end
            if callback then
                callback(return_val == 0, result)
            end
        end,
    })

    job:sync()
    return job.code == 0
end

return BuildTool