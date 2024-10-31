-- Remaps
local builtin = require("telescope.builtin")

-- TODO: udv.keymap_leader
vim.keymap.set('n', '<leader>pv', builtin.git_files, {})    -- Project - VCS Files
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})   -- Project - Files
vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})    -- Project - Grep

