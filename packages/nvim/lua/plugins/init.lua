return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function() 
            require("config.plugin.catppuccin")
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "kyazdani42/nvim-web-devicons",
            "ryanoasis/vim-devicons"
        },
        config = function()
            require("config.plugin.lualine")
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("config.plugin.treesitter")
        end
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("config.plugin.telescope")
        end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("config.plugin.lsp")
        end
    },
    {
        "folke/neodev.nvim",
        config = function()
            require("config.plugin.neodev")
        end
    },
}