{ packages, ... }:

{
    environment.systemPackages = with packages; [
        ### Command line tools
        unstable.starship
        unstable.neofetch
        unstable.htop
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
        # Editors
        unstable.vim
        unstable.neovim
        unstable.vscode
        # Tools
        unstable.wireshark
        # IDEs

        # Applications
        unstable.spotify
        unstable.vesktop
        unstable.google-chrome
    ];

    programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
    };
}