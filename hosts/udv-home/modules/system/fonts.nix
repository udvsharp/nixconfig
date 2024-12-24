{ config, lib, packages, ... }:

{
    fonts = {
        packages = with packages.unstable; [
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