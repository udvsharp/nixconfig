{ config, packages, dotsrc, ... }:

{
    home.sessionVariables = {
        EDITOR = "nvim";
    };

    programs.neovim = {
        enable = true;
        
        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;

        defaultEditor = true;

        plugins = let
           fromLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n"; 
        in with packages.unstable.vimPlugins; [
            {
                plugin = nvim-treesitter.withAllGrammars;
                config = fromLuaFile "${dotsrc}/nvim/lua/udv/plugins/config/treesitter.lua";
            }
        ];
    };    
}
