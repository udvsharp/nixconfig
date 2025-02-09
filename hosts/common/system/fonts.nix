{ config, lib, pkgs, ... }:

{
    fonts = {
        packages = with pkgs.unstable; [
            # Monospace
            # jetbrains-mono
            # Nerdfonts
            nerd-fonts.jetbrains-mono
        ];

        fontconfig = {
            enable = true;
            defaultFonts = {
                monospace = [ "JetBrains Mono NF" "Consolas" ];
            };
        };
    };
}