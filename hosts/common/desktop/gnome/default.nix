{ config, lib, pkgs, ... }:
# Using GNOME desktop with Wayland
{
    config = lib.mkIf (config.udv.desktop == "gnome") {
        services.udev.packages = with pkgs.stable; [ gnome-settings-daemon ];

        # Enable wayland windowing system.
        services.xserver = {
            # Required for launch
            enable = true;

            # Enable the GNOME display manager
            # and use Wayland as the backend
            displayManager.gdm = {
                enable = true;
                wayland = true;
            };

            # Enable the GNOME desktop environment
            desktopManager.gnome.enable = true;
        };

        services.displayManager.defaultSession = "gnome";

        # Exclude Xserver packages
        services.xserver.excludePackages = with pkgs.stable; [
            xterm
        ];

        # Exclude unused GNOME packages
        environment.gnome.excludePackages = (with pkgs.stable; [
            gnome-tour
            gnome-photos
            gnome-connections
            
            gedit       # Text editor
        ]) ++ (with pkgs.stable; [
            gnome-calculator
            gnome-calendar
            gnome-characters 
            gnome-clocks
            gnome-contacts
            gnome-font-viewer
            gnome-logs
            gnome-maps
            gnome-music
            gnome-screenshot
            gnome-weather
            gnome-terminal

            # Leaving enabled intentionally
            # gnome-system-monitor
            # gnome-disk-utility
        ]) ++ (with pkgs.stable; [
            baobab      # Disk usage analyzer
            cheese      # Photo booth
            eog         # Image viewer
            epiphany    # Web browser
            simple-scan # Document scanner
            totem       # Video player
            yelp        # Help viewer
            evince      # Document viewer
            file-roller # Archive manager
            geary       # Email client
            seahorse    # Password manager
        ]);

        # Extensions
        environment.systemPackages = (with pkgs.stable; [
            gdm
        ]) ++ (with pkgs.stable.gnomeExtensions; [
            # gse
            # gse-extensions
            # gse-extensions-extra
        ]);

        # For electron-based apps and chromium
        environment.sessionVariables = {
            NIXOS_OZONE_WL = "1";
        };

        # Configure keymap in X11
        # services.xserver.xkb.layout = "us";
        # services.xserver.xkb.options = "eurosign:e,caps:escape";
    };
}

