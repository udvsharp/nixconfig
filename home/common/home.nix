{ lib, pkgs, ... }:

{
    imports = [
        ./tools
    ];

    programs.home-manager.enable = true;
    programs.bash.enable = true;
}