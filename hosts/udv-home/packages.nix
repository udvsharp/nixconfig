{ packages, ... }:

{
    # TODO: define packages in their file by groups
    environment.systemPackages = with packages; [
        ### Command line tools
        unstable.neofetch
        unstable.htop
        unstable.efibootmgr
        unstable.wget
        unstable.curl
        unstable.unzip
        unstable.cmatrix
        unstable.comma

        ### Development
        unstable.kitty
        unstable.nerdfonts
        # CLI
        unstable.git
        unstable.gh
        unstable.ripgrep
        # Editors
        unstable.vim
        unstable.neovim
        unstable.vscode
        # Tools
        unstable.wireshark
        # IDEs

        # Applications
        unstable.telegram-desktop
        unstable.spotify
        unstable.vesktop
        unstable.google-chrome
        unstable.logiops
    ];

    programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
    };
}
