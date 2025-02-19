{ config, lib, pkgs, dotsrc, ... }:

{
    programs.neovim = {
        enable = true;
        
        viAlias = true;
        vimAlias = false;
        vimdiffAlias = true;

        defaultEditor = true;
    };
}
