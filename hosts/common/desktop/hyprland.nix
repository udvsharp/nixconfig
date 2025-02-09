{ config, lib, pkgs, ... }:

{
    config = lib.mkIf (config.udv.desktop == "hyprland") {
        programs.hyprland = {
            enable = true;
            nvidiaPatches = true;
            xwayland.enable = true;
        };

        environment.sessionVariables = {
            # If cursor becomes invisible
            WRL_NO_HARDWARE_CURSORS = "1";
            # Hint for electron apps to use wayland
            NIXOS_OZONE_WL = "1";
        };

        environment.systemPackages = with pkgs.stable; [
            (waybar.overrideAttrs (oldAttrs: {
                    mesonFlags = oldAttrs.mesonFlags ++ [
                        "-Dexperimental=true"
                    ];
                })
            )

            libnotify
            dunst

            rofi-wayland
        ];

        xdg.portal.enable = true;
        xdg.portal.extraPortals = with pkgs.stable; [
            xdg-desktop-portal-gtk
        ];
    };
}