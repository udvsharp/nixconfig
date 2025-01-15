require("udv.prelude.util")

local LOAD_FIRST_PRIORITY = 1000
local LOAD_EARLY_PRIORITY = 100
local BASE_PLUGINS_PATH = "udv.plugins"

local CONFIG_DIR = vim.fn.stdpath("config")
local THEMES_CONFIG_DIR = CONFIG_DIR .. "/themes"

local plugins = {};

local function plugin_config_module(module_type, plugin_info)
    return BASE_PLUGINS_PATH .. '.' .. module_type .. '.' .. plugin_info.name
end

local function add_plugin(plugin_info)
    if plugin_info.disabled then
        return None
    end

    local plugin_opts_module = plugin_config_module("opts", plugin_info)
    local plugin_init_module = plugin_config_module("init", plugin_info)
    local plugin_config_module = plugin_config_module("config", plugin_info)

    local plugin_generated = {
        opts = safe_require(plugin_opts_module), -- FIXME: this doesn't work for some reason
        config = function()
            safe_require(plugin_config_module)
        end,
        init = function()
            safe_require(plugin_init_module)
        end,
    }

    local plugin = vim.tbl_extend("error", plugin_info, plugin_generated)

    table.insert(plugins, plugin)

    return plugin_info
end

---- Base plugins
add_plugin {
    "nvim-lua/plenary.nvim",
    name = "plenary",
    priority = LOAD_FIRST_PRIORITY,
    lazy = true,
}

---- Icons/UI
local nvim_web_devicons_plugin = {
    "kyazdani42/nvim-web-devicons",
}

local mini_plugin = {
    "echasnovski/mini.nvim",
    version = "*",
}

local vim_devicons_plugin = {
    "ryanoasis/vim-devicons",
}

local nui_plugin = {
    "MunifTanjim/nui.nvim",
}

---- Used plugins
local function themes_from_directory(directory)
    local themes = {}

    local uv = vim.loop
    local handle = uv.fs_scandir(directory)

    if not handle then
        error("Failed to open directory: " .. directory)
    end

    while true do
        local name, type = uv.fs_scandir_next(handle)
        if not name then
            break
        end

        if type == "directory" then
            table.insert(themes, {
                dir = directory .. "/" .. name,
                lazy = false, -- Otherwise telescope won't find them
            })
        end
    end

    return themes
end

local themes = themes_from_directory(THEMES_CONFIG_DIR)
table.insert(themes, { "ramojus/mellifluous.nvim", lazy = false })

add_plugin {
    "rktjmp/lush.nvim",
    themes,
    name = "lush",
    priority = LOAD_FIRST_PRIORITY,
}

add_plugin {
    "folke/which-key.nvim",
    name = "whichkey",
    event = "VeryLazy",
    dependencies = {
        nvim_web_devicons_plugin,
        mini_plugin,
    },
}

-- On NixOS nvim comes with treesitters bundled
-- if not is_nixos() then
    local treesitter_extension_textobjects = {"nvim-treesitter/nvim-treesitter-textobjects"}

    add_plugin {
        "nvim-treesitter/nvim-treesitter",
        name = "treesitter",
        version = false, -- It was said that last release is way too old and doesn't work on windows
        build = ":TSUpdate",
        dependencies = {
            treesitter_extension_textobjects,
        }
    }
-- end

add_plugin {
    "nvim-lualine/lualine.nvim",
    name = "lualine",
    dependencies = {
        nvim_web_devicons_plugin,
        vim_devicons_plugin,
    },
    event = "VeryLazy",
}

local telescope_extension_ui_select = {"nvim-telescope/telescope-ui-select.nvim"}

local telescope_extension_fzf_native = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = make,
}

add_plugin {
    "nvim-telescope/telescope.nvim",
    name = "telescope",
    tag = "0.1.8",
    dependencies = {
        telescope_extension_ui_select,
        telescope_extension_fzf_native,
    },
}

local lazydev_plugin = {
    "folke/lazydev.nvim",
    ft = "lua", -- Only load on lua files
    opts = {
        library = {{
            path = "${3rd}/luv/library",
            words = {"vim%.uv"}
        }},
    },
}

add_plugin {
    "neovim/nvim-lspconfig",
    name = "lspconfig",
    dependencies = {
        lazydev_plugin,
    }
}

add_plugin {
    'numToStr/Comment.nvim',
    name = "comment",
}

local window_picker_plugin = add_plugin {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    version = "2.*",
    lazy = true,
}

add_plugin {
    "nvim-neo-tree/neo-tree.nvim",
    name = "neotree",
    branch = "v3.x",
    event = "VeryLazy",
    dependencies = {
        nvim_web_devicons_plugin,
        nui_plugin,
        window_picker_plugin,
    }
}

add_plugin {
    "akinsho/toggleterm.nvim",
    name = "toggleterm",
    disabled = true,
    version = "v2.*"
}

add_plugin {
    "nvimdev/dashboard-nvim",
    name = "dashboard",
    event = "VimEnter",
    dependencies = {
        nvim_web_devicons_plugin,
    },
}

local cmp_nvim_lsp_extension = { "hrsh7th/cmp-nvim-lsp" }
local cmp_nvim_buffer_extension = { "hrsh7th/cmp-buffer" }
local cmp_nvim_path_extension = { "hrsh7th/cmp-path" }

local lspkind_plugin = { "onsails/lspkind.nvim" }

add_plugin {
    "hrsh7th/nvim-cmp",
    name = "cmp",
    lazy = false,
    priority = LOAD_EARLY_PRIORITY,
    dependencies = {
        cmp_nvim_lsp_extension,
        cmp_nvim_buffer_extension,
        cmp_nvim_path_extension,
        
        lspkind_plugin,
    },
}

add_plugin {
    "ThePrimeagen/harpoon",
    name = "harpoon",
    branch = "harpoon2",
}

add_plugin {
    "stevearc/oil.nvim",
    name = "oil",
    dependencies = {
        nvim_web_devicons_plugin,
    },
}

return plugins
