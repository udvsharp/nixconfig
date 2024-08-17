{ config, lib, packages, ... }:

{
    fonts = {
        packages = with packages.stable; [
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