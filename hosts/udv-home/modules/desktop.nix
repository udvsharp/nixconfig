{ config, lib, pkgs, ... }:
# Using GNOME desktop with Wayland
# TODO: different configs per desktop
{
    services.udev.packages = with pkgs.gnome; [ gnome-settings-daemon ];

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
    services.xserver.excludePackages = with pkgs; [
        xterm
    ];

    # Exclude unused GNOME packages
    environment.gnome.excludePackages = (with pkgs; [
        gnome-tour
        gnome-photos
        gnome-connections
        
        gedit       # Text editor
    ]) ++ (with pkgs.gnome; [
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

        # Leaving enabled intentionally
        # gnome-system-monitor
        # gnome-disk-utility
        # gnome-terminal
    ]) ++ (with pkgs.gnome; [
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
    # TODO: test if this works in different files
    # Seems like it should, redefinition isn't allowed only in scope of one flake
    environment.systemPackages = (with pkgs; [
        gnome.gdm
    ]) ++ (with pkgs.gnomeExtensions; [
        # gse
        # gse-extensions
        # gse-extensions-extra
    ]);

    # Configure keymap in X11
    # services.xserver.xkb.layout = "us";
    # services.xserver.xkb.options = "eurosign:e,caps:escape";
}
