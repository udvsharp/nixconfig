local Target = require('pcfg.build.core.target')
local log = require('pcfg.log')

---@class CMakeTarget : Target
---@field build_dir string CMake build directory
---@field build_type string Build type (Debug/Release)
---@field generator string CMake generator (Ninja/Make)
local CMakeTarget = setmetatable({}, { __index = Target })
CMakeTarget.__index = CMakeTarget

---@param opts {name: string, type: "executable"|"library", build_dir: string, build_type: string, generator?: string}
---@return boolean success
---@return string? error
local function validate_cmake_opts(opts)
    if not opts.build_dir then return false, "Build directory required" end
    if not opts.build_type then return false, "Build type required" end
    return true
end

function CMakeTarget:new(opts)
    local ok, err = validate_cmake_opts(opts)
    assert(ok, err)

    local target = Target:new({
        name = opts.name,
        type = opts.type,
        metadata = {
            build_dir = opts.build_dir,
            build_type = opts.build_type,
            generator = opts.generator or "Ninja"
        }
    })

    log.debug(string.format("[CMake] Creating target %s (%s)", opts.name, opts.type))
    return setmetatable(target, self)
end

return CMakeTarget