{ config, lib, pkgs, ... }:

{
    options.udv.desktop = lib.mkOption {
        type = lib.types.str;
        default = "hyprland";
        example = "hyprland";
        description = ''
            Selection of desktop environment to use.
            Valid options are: "gnome", "hyprland"
        '';
    };

    # TODO: setup displays?
    imports = [
        ./gnome
        ./hyprland
    ];
}