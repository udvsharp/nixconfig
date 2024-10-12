local function is_nixos()
    local uname_info = vim.loop.os_uname().version
    return string.find(uname_info, "NixOS") ~= nil
end

-- If system is not NixOS, include lazy.lua
-- if not is_nixos() then
    require("config.lazy")
-- end