{ config, lib, pkgs, dotsrc, ... }:

{
    home.username = "udv";
    home.homeDirectory = "/home/udv";

    imports = [
        ./modules/kitty.nix
        ./modules/nvim.nix
        ./modules/starship.nix
    ];
}
