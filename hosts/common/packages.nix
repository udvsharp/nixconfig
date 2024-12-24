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
        unstable.ripgrep
        unstable.cmatrix
        unstable.comma
        unstable.tokei

        unstable.fzf
        unstable.fd

        ### Development
        unstable.kitty
        # CLI
        unstable.git
        unstable.gh
        # Editors
        unstable.vim
        unstable.neovim
        unstable.tmux
        unstable.vscode
        # Tools
        unstable.wireshark
        # IDEs
        unstable.jetbrains.clion
        
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
