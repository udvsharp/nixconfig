-- Remaps
local builtin = require("telescope.builtin")

-- TODO: udv.keymap_leader
vim.keymap.set('n', '<leader>pf', builtin.git_files, {})
