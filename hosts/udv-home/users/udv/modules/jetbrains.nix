{ config, lib, pkgs, ... }:

{
    imports = [
        # ./jetbrains/override.nix # TODO: doesn't work for now
    ];

    home.packages = with pkgs.jetbrains; [
        clion
        rust-rover
    ];
}