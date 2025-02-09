local map = require("udv.utils.keymap")

-- Splits Navigation
map.nnoremap("<C-h>", "<C-W><C-h>") -- Window left
map.nnoremap("<C-j>", "<C-W><C-j>") -- Window down 
map.nnoremap("<C-k>", "<C-W><C-k>") -- Window up
map.nnoremap("<C-l>", "<C-W><C-l>") -- Window right
-- Moving things around
map.vnoremap("J", ":m '>+1<CR>gv=gv'")
map.vnoremap("K", ":m '>-2<CR>gv=gv'")
-- Wrap next line to the end of current
map.nnoremap("J", "mzJ`z")
-- Cursor in the middle while scrolling
map.nnoremap("<C-d>", "<C-d>zz")
map.nnoremap("<C-u>", "<C-u>zz")
-- Cursor in the middle while searching
map.nnoremap("n", "nzzzv")
map.nnoremap("N", "Nzzzv")
-- Clipboard
map.xnoremap("<leader>p", [["_dP]])
map.nnoremap("<leader>y", [["+y]])
map.vnoremap("<leader>y", [["+y]])
map.nnoremap("<leader>Y", [["+Y]])
-- Quickfix lists
map.nnoremap("<leader>j", "<cmd>cnext<CR>zz")
map.nnoremap("<leader>k", "<cmd>cprev<CR>zz")
map.nnoremap("<leader>J", "<cmd>lnext<CR>zz")
map.nnoremap("<leader>K", "<cmd>lprev<CR>zz")
-- Find&Replace current word
map.nnoremap("<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

map.nnoremap("Q", "<nop>")

