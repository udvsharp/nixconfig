{ pkgs, ... }:

{
    # TODO: define packages in their file by groups
    environment.systemPackages = with pkgs; [
        ### Command line tools
        neofetch
        htop
        efibootmgr

        ### Development
        # CLI
        git
        gh
        # Editors
        vim
        vscode
        # Tools
        wireshark
        # IDEs
        # TODO: install JetBrains products
        # TODO: install compilers, languages

        # Applications
        telegram-desktop
        spotify
        vesktop
        google-chrome
    ];

    # For electron-based apps and chromium
    environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
    };
}
