local set = vim.keymap.set

---- Splits
-- Navigation
set("n", "<C-h>", "<C-W><C-h>") -- Window left
set("n", "<C-j>", "<C-W><C-j>") -- Window down 
set("n", "<C-k>", "<C-W><C-k>") -- Window up
set("n", "<C-l>", "<C-W><C-l>") -- Window right
-- Resizing
set("n", "<M-h>", "<C-W>5<")  -- Horizontal minus
set("n", "<M-j>", "<C-W>-")   -- Vertical plus
set("n", "<M-k>", "<C-W>+")   -- Vertical minus
set("n", "<M-l>", "<C-W>5>")  -- Horizontal plus

-- Search

-- Config hotkeys
-- TODO: only in lua files
set("n", "<leader>x", "<cmd>.lua<CR>", { desc = "Execute current line" })
set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Execute current file" })
