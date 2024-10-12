{ config, packages, dotsrc, ... }:

{
    programs.neovim = {
        enable = true;
        
        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;
    };

    home.file."${config.home.homeDirectory}/.config/nvim".source
        = config.lib.file.mkOutOfStoreSymlink "${dotsrc}/nvim";
}