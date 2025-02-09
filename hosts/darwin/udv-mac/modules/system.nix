{ config, lib, pkgs, ... }:

{
    system.defaults = {
        dock = {
            autohide = true;
            tilesize = 48;
            mineffect = "scale";
            largesize = 16;
            mru-spaces = false;
            launchanim = true;
            showhidden = true;
            orientation = "bottom";
            static-only = false;
            show-recents = false;
            magnification = false;
            autohide-delay = 0.75;
            # TODO: hot corners also setup here
            # TODO: misc others
        };

        finder = {
            ShowPathbar = true;
            QuitMenuItem = true;
            ShowStatusBar = true;
            CreateDesktop = true;
            AppleShowAllFiles = true;
            FXPreferredViewStyle = "Nlsv";
            AppleShowAllExtensions = true;
            _FXShowPosixPathInTitle = true;
            FXEnableExtensionChangeWarning = false;
        };

        screencapture = {
            location = "~/Pictures/Screenshots";
            type = "png";
        };
    };
}