{ config, lib, pkgs, dotsrc, ... }:

{
    home.username = "udv";
    home.homeDirectory = "/home/udv";

    home.sessionVariables = {
        EDITOR = "nvim";
    };

    imports = [
        ./modules/kitty.nix
        ./modules/nvim.nix
        ./modules/starship.nix
    ];
}
