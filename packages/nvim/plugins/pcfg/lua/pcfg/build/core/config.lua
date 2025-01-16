---@class BuildConfig
---@field name string Config name (Debug/Release)
---@field build_dir string Build directory path
---@field env table<string, string> Environment variables
---@field options table<string, any> Tool-specific options
local BuildConfig = {}
BuildConfig.__index = BuildConfig

---@param opts {name: string, build_dir: string, env?: table, options?: table}
---@return boolean success
---@return string? error
local function validate(opts)
    if not opts.name then return false, "Config name required" end
    if not opts.build_dir then return false, "Build directory required" end
    return true
end

---@param opts {name: string, build_dir: string, env?: table, options?: table}
function BuildConfig:new(opts)
    local ok, err = validate(opts)
    assert(ok, err)

    local instance = setmetatable({}, self)
    instance.name = opts.name
    instance.build_dir = opts.build_dir
    instance.env = vim.tbl_deep_extend("force", {}, opts.env or {})
    instance.options = vim.tbl_deep_extend("force", {}, opts.options or {})
    return instance
end

---@param config BuildConfig
---@return boolean
function BuildConfig:equals(config)
    return self.name == config.name 
        and self.build_dir == config.build_dir
end

---@return table<string, string>
function BuildConfig:get_env()
    return vim.tbl_deep_extend("force", {}, self.env)
end

---@return table<string, any>
function BuildConfig:get_options()
    return vim.tbl_deep_extend("force", {}, self.options)
end

return BuildConfig