{ packages, ... }:

{
    # TODO: define packages in their file by groups
    environment.systemPackages = with packages.stable; [
        ### Command line tools
        neofetch
        htop
        efibootmgr
        wget
        curl
        unzip
        cmatrix
        comma

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

        # Applications
        telegram-desktop
        spotify
        vesktop
        google-chrome
    ];

    programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
    };
}
