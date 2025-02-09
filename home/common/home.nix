{ lib, pkgs, ... }:

{
    imports = [
        ./tools
    ];

    programs.home-manager.enable = true;
}