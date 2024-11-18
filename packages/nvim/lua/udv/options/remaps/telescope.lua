-- Remaps
local builtin = require("telescope.builtin")

-- TODO: udv.keymap_leader
vim.keymap.set('n', '<leader>ff', builtin.find_files,           { desc = "Find - Files" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep,            { desc = "Find - Grep" })
vim.keymap.set('n', '<leader>fb', builtin.buffers,              { desc = "Find - Buffers" }) 
vim.keymap.set('n', '<leader>fh', builtin.help_tags,            { desc = "Find - Help tags" })
vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = "Find - Symbols" })
vim.keymap.set('n', '<leader>fr', builtin.oldfiles,             { desc = "Find - Recent" })
vim.keymap.set('n', '<leader>fk', builtin.keymaps,              { desc = "Find - Keymaps" })

vim.keymap.set('n', '<leader>vb', builtin.git_branches, { desc = "VCS - Branches" })
vim.keymap.set('n', '<leader>vc', builtin.git_commits,  { desc = "VCS - Commits" })

