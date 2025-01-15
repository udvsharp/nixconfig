local set = vim.keymap.set

-- Splits Navigation
set("n", "<C-h>", "<C-W><C-h>") -- Window left
set("n", "<C-j>", "<C-W><C-j>") -- Window down 
set("n", "<C-k>", "<C-W><C-k>") -- Window up
set("n", "<C-l>", "<C-W><C-l>") -- Window right

-- Moving things around
set("v", "J", ":m '>+1<CR>gv=gv'")
set("v", "K", ":m '>-2<CR>gv=gv'")
-- Wrap next line to the end of current
set("n", "J", "mzJ`z")
-- Cursor in the middle while scrolling
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
-- Cursor in the middle while searching
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")
-- Clipboard
set("x", "<leader>p", [["_dP]])
set("n", "<leader>y", [["+y]])
set("v", "<leader>y", [["+y]])
set("n", "<leader>Y", [["+Y]])
-- Quickfix lists
set("n", "<leader>j", "<cmd>cnext<CR>zz")
set("n", "<leader>k", "<cmd>cprev<CR>zz")
set("n", "<leader>J", "<cmd>lnext<CR>zz")
set("n", "<leader>K", "<cmd>lprev<CR>zz")
-- Replace current word
set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

set("n", "Q", "<nop>")

-- Config hotkeys
-- TODO: only in lua files
set("n", "<leader>x", "<cmd>.lua<CR>", { desc = "Execute current line" })
set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Execute current file" })
