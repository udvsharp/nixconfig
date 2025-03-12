---@class regx
---@field patterns Pattern[]
local regx = {}
regx.__index = regx

---@class Pattern
---@field name string pattern name
---@field match (string|function) regex string to match
---@field url string base URL
regx.patterns = {}

local function get_open_cmd(url)
    local sysname = vim.loop.os_uname().sysname

    if sysname == "Darwin" then
        return { "open", url}
    elseif sysname == "Linux" then
        return { "xdg-open", url }
    elseif sysname == "Windows_NT" then
        return { "cmd.exe", "/c", "start", url }
    end
end

function regx:highlight()
    for _, pattern in ipairs(self.patterns) do
        local hl_group = "CustomLink_" .. pattern.name:gsub("%s+", "_")

        if not vim.fn.hlID(hl_group) then
            vim.cmd(string.format("highlight %s gui=underline cterm=underline ctermfg=Blue guifg=Blue", hl_group))
        end

        vim.cmd(string.format("syntax match %s /%s/", hl_group, pattern.match))
    end
end

function regx:setup_highlight()
    self:highlight()
end

function regx:match(pattern, word)
    if type(pattern.match) == "string" then
        return word:match(pattern.match)
    elseif type(pattern.match) == "function" then
        return pattern.match(word)
    end
end

function regx:open_link(word)
    for _, pattern in ipairs(self.patterns) do
        local match = self:match(pattern, word)
        if match then
            local full_url = pattern.url .. match
            vim.fn.system(get_open_cmd(full_url))
            return
        end
    end
end

function regx:open_current_word()
    local word = vim.fn.expand("<cword>")
    if word and word ~= "" then
        self:open_link(word)
    end
end

--- Adds new matcher
---@param pattern Pattern
function regx:add(pattern)
    table.insert(self.patterns, pattern)
    self:highlight()
end

function regx:setup()
    self:setup_highlight()
    vim.keymap.set("n", "gx", function() self:open_current_word() end, { noremap = true, silent = true })
end

return regx

