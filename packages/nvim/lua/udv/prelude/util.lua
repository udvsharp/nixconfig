function is_module_available(name)
    if package.loaded[name] then
        return true
    end

    for _, searcher in ipairs(package.searchers or package.loaders) do
        local loader = searcher(name)
        if type(loader) == 'function' then
            return true
        end
    end

    return false
end

function safe_require(name)

    if is_module_available(name) then
        local ok, module = pcall(require, name)
        if ok then
            return module
        else
            error("Error while loading " .. name)
            return nil 
        end
    end

    local init_name = name .. ".init"
    if is_module_available(init_name) then
        local ok, module = pcall(require, init_name)
        if ok then
            return module
        else
            error("Error while loading " .. init_name)
            return nil 
        end
    end

    return nil
end

function is_nixos()
    local uname_info = vim.loop.os_uname().version
    return string.find(uname_info, "NixOS") ~= nil
end

function is_windows()
    -- TODO: implement someday
    -- Should support bash, powershell...ough
    return false
end
