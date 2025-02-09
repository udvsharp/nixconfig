function get_module_paths(name)
    local paths = {}
    for path in package.path:gmatch("[^;]+") do
        path = path:gsub("?", name:gsub("%.", "/"))
        table.insert(paths, path)
    end
    return paths
end

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

function format_load_error(name, err)
    local lines = {
        "\nModule load error: " .. name,
        "Error: " .. tostring(err),
        "\nSearch paths:"
    }
    
    for path in package.path:gmatch("[^;]+") do
        table.insert(lines, "  " .. path:gsub("?", name:gsub("%.", "/")))
    end
    
    table.insert(lines, "\nStack trace:")
    table.insert(lines, debug.traceback("", 2))
    
    return table.concat(lines, "\n")
end


function safe_require(name)
    -- Check main module
    if is_module_available(name) then
        local ok, result = pcall(require, name)
        if ok then
            return result
        else
            error(format_load_error(name, result))
        end
    end

    -- Try with .init
    local init_name = name .. ".init"
    if is_module_available(init_name) then
        local ok, result = pcall(require, init_name)
        if ok then
            return result
        else
            error(format_load_error(init_name, result))
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
