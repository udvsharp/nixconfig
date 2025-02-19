{ config, lib, pkgs, ... }:

{
    config = lib.mkIf (config.udv.desktop == "hyprland") {
        services.xserver.displayManager.gdm.wayland = true;

        programs.hyprland = {
            enable = true;
            xwayland.enable = true;
        };

        environment.sessionVariables = {
            NIXOS_OZONE_WL              = "1"; # for ozone-based and electron apps to run on wayland
            WLR_RENDERER_ALLOW_SOFTWARE = "1";
            WLR_NO_HARDWARE_CURSORS     = "1";

            XDG_SESSION_TYPE = "wayland";
            QT_QPA_PLATFORM  = "wayland";
        };

        environment.systemPackages = with pkgs.stable; [
            waybar

            libnotify
            dunst

            swww

            rofi-wayland
        ];

        xdg.portal.enable = true;
    };
}