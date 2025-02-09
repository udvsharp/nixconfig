require("udv.prelude.util")

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.showmode = false
vim.o.cursorline = true
vim.o.signcolumn = "yes"

-- Line numbers
vim.o.relativenumber = true
vim.o.number = true
vim.o.nuw = 4

-- Tabs, spaces
local tab_width = 4
vim.o.tabstop = tab_width
vim.o.shiftwidth = tab_width
vim.o.expandtab = true
vim.o.autoindent = true

-- Splits
vim.o.splitbelow = true
vim.o.splitright = true

-- Editor behaviour
vim.o.wrap = false
vim.o.scrolloff = 16

-- Completion
vim.o.completeopt = "menu,menuone,noselect"
-- vim.o.shortmess

-- Visual-Block mode
vim.o.virtualedit = "block" -- TODO: test "all" and "insert"

-- Search&Replace
vim.o.inccommand = "split"

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Misc
vim.o.updatetime = 300
vim.o.termguicolors = true

-- In case you don't want to use `:LazyExtras`,
-- then you need to set the option below.
vim.g.lazyvim_picker = "telescope"

if is_windows() then
    vim.opt.shell = "bash.exe"
    vim.opt.shellcmdflag = "-s"
end
