local wp = require("window-picker")

local function pick_window()
    local picked_window_id = wp.pick_window()
    if picked_window_id then
        vim.api.nvim_set_current_win(picked_window_id)
    end
end

vim.keymap.set('n', "<S-w>", pick_window, { desc = "Pick a window" })
