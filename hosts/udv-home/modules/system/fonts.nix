{ config, lib, pkgs, ... }:

{
    fonts = {
        packages = with pkgs; [
            # Monospace
            jetbrains-mono
            fira-code
        ];

        fontconfig = {
            defaultFonts = {
                monospace = [ "JetBrains Mono" "Fira Code" "Consolas" ]; # TODO: doesn't work for terminal
            };
        };
    };
}