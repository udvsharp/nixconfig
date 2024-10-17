vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Integrate with system clipboard
vim.o.clipboard = 'unnamedplus'

-- Line numbers
vim.o.number = true
vim.o.nuw = 4

-- Tabs, spaces
local tab_width = 4
vim.o.tabstop = tab_width
vim.o.shiftwidth = tab_width
vim.o.expandtab = true

-- Splits
vim.o.splitbelow = true
vim.o.splitright = true

-- Editor behaviour
vim.o.wrap = false
vim.o.scrolloff = 16

-- Visual-Block mode
vim.o.virtualedit = "block" -- TODO: test "all" and "insert"

-- Search&Replace
vim.o.inccommand = "split"

-- Misc
vim.o.ignorecase = true
vim.o.updatetime = 300
vim.o.termguicolors = true

