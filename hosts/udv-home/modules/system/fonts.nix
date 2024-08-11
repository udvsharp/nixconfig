{ config, lib, pkgs, ... }:

{
    fonts = {
        packages = with pkgs; [
            # Monospace
            jetbrains-mono
            fira-code
        ];

        fontconfig = {
            enable = true;
            defaultFonts = {
                monospace = [ "JetBrains Mono" "Fira Code" "Consolas" ];
            };
        };
    };
}