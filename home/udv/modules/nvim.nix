{ config, lib, pkgs, dotsrc, ... }:

{
    programs.neovim = {
        enable = true;
        
        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;

        defaultEditor = true;
    };
}
