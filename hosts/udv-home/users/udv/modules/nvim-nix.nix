{ config, packages, dotsrc, ... }:

{ # TODO: figure out
    programs.neovim = {
        enable = true;
        
        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;

        extraLuaConfig = ''
            ${builtins.readFile "${dotsrc}/nvim/lua/options/init.lua"}
        '';

        plugins = let
            toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
        in (with packages.unstable.vimPlugins; [
            {
                plugin = nvim-lspconfig;
                config = toLuaFile "${dotsrc}/nvim/lua/config/plugin/lsp.lua";
            }
            {
                plugin = comment-nvim;
                config = toLuaFile "${dotsrc}/nvim/lua/config/plugin/comment.lua";
            }
            {
                plugin = telescope-nvim;
                config = toLuaFile "${dotsrc}/nvim/lua/config/plugin/telescope.lua";   
            }
            {
                plugin = telescope-ui-select-nvim;
                config = toLuaFile "${dotsrc}/nvim/lua/config/plugin/telescope-ui-select.lua";
            }
            {
                plugin = (nvim-treesitter.withPlugins (p: with p; [
                    tree-sitter-c
                    tree-sitter-cpp
                    tree-sitter-cmake
                    tree-sitter-vim
                    tree-sitter-vimdoc
                    tree-sitter-json
                    tree-sitter-bash
                    tree-sitter-python
                    tree-sitter-html
                    tree-sitter-css
                    tree-sitter-javascript
                    tree-sitter-doxygen
                    tree-sitter-glsl
                    tree-sitter-hlsl
                    tree-sitter-java
                    tree-sitter-kotlin
                    tree-sitter-nix
                    tree-sitter-sql
                    tree-sitter-yaml
                    tree-sitter-toml
                    tree-sitter-zig
                    tree-sitter-rust
                    tree-sitter-lua
                    tree-sitter-markdown
                ]));
                config = toLuaFile "${dotsrc}/nvim/lua/config/plugin/treesitter.lua";
            }
            {
                plugin = lualine-nvim;
                config = toLuaFile "${dotsrc}/nvim/lua/config/plugin/lualine.lua";
            }
            {
                plugin = catppuccin-nvim;
                config = toLuaFile "${dotsrc}/nvim/lua/config/plugin/catppuccin.lua";
            }
            {
                plugin = neodev-nvim;
                config = toLuaFile "${dotsrc}/nvim/lua/config/plugin/neodev.lua";
            }
            nvim-web-devicons
            vim-nix
        ]);

        extraPackages = with packages.unstable; [
            lua-language-server

            xclip
            wl-clipboard
        ];
    };
}