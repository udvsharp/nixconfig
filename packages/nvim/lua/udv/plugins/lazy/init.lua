local plugins = {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function() 
            require("udv.plugins.config.catppuccin")
        end
    },
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			require("udv.plugins.config.gruvbox")
            
            vim.cmd.colorscheme "gruvbox"
            vim.o.background = "dark"
		end
	},
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "kyazdani42/nvim-web-devicons",
            "ryanoasis/vim-devicons"
        },
        config = function()
            require("udv.plugins.config.lualine")
        end
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("udv.plugins.config.telescope")
        end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("udv.plugins.config.lsp")
        end
    },
    {
        "folke/neodev.nvim",
        config = function()
            require("udv.plugins.config.neodev")
        end
    },
}

-- Add treesitters only on non-nixos systems
-- On NixOS nvim comes with treesitters bundled, otherwise will conflict
if not is_nixos() then
    table.insert(plugins, {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("udv.plugins.config.treesitter")
        end
    })
end

return plugins
