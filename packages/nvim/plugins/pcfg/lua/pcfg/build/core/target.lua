---@class Target
---@field name string Target name
---@field type string Target type (executable/library/custom)
---@field dependencies string[] List of target dependencies
---@field metadata table Additional target-specific data
local Target = {}
Target.__index = Target

---Validates target configuration
---@param opts table Configuration table
---@return boolean is_valid
---@return string? error_message
local function validate(opts)
    if not opts.name then return false, "Target name is required" end
    if not opts.type then return false, "Target type is required" end
    if not vim.tbl_contains({ "executable", "library", "custom" }, opts.type) then
        return false, "Invalid target type: " .. opts.type
    end
    return true
end

---Creates a new target instance
---@param opts table Configuration table
---@field name string Target name
---@field type string Target type
---@field dependencies? string[] List of dependencies
---@field metadata? table Additional metadata
---@return Target
function Target:new(opts)
    local is_valid, error_message = validate(opts)
    assert(is_valid, error_message)

    local instance = setmetatable({}, self)
    instance.name = opts.name
    instance.type = opts.type
    instance.dependencies = opts.dependencies or {}
    instance.metadata = opts.metadata or {}
    return instance
end

---Add a dependency to the target
---@param target_name string Name of the target dependency
function Target:add_dependency(target_name)
    if not vim.tbl_contains(self.dependencies, target_name) then
        table.insert(self.dependencies, target_name)
    end
end

---Get target information as a table
---@return table Target information
function Target:get_info()
    return {
        name = self.name,
        type = self.type,
        dependencies = self.dependencies,
        metadata = self.metadata
    }
end

---Pretty print target information
function Target:info()
    print(string.format("Target: %s (%s)", self.name, self.type))
    if #self.dependencies > 0 then
        print("Dependencies:")
        for _, dep in ipairs(self.dependencies) do
            print("  - " .. dep)
        end
    end
    if next(self.metadata) then
        print("Metadata:")
        for k, v in pairs(self.metadata) do
            print(string.format("  %s: %s", k, tostring(v)))
        end
    end
end

return Target