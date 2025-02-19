{ config, lib, pkgs, ... }:

{
    environment.systemPackages
    = with pkgs; ([
        unstable.cmatrix
        unstable.comma

        unstable.starship
        unstable.neofetch
        unstable.htop

        unstable.wget
        unstable.curl

        unstable.unzip
        unstable.tokei

        unstable.fzf
        unstable.fd
        unstable.grc
        unstable.ripgrep

        unstable.git
        unstable.gh

        unstable.tmux
    ] ++ [
        unstable.kitty

        unstable.vim
        unstable.neovim
        unstable.vscode

        unstable.wireshark

        unstable.jetbrains.clion
    ] ++ [
        unstable.google-chrome
        unstable.zoom-us
        unstable.spotify
        unstable.vesktop
    ]);
}
