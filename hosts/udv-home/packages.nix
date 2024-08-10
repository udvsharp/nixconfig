{ pkgs, ... }:

{
    # TODO: define packages in their file by groups
    environment.systemPackages = with pkgs; [
        ### Command line tools
        htop

        ### Development
        # CLI
        git
        gh
        # Editors
        vim
        vscode
        # IDEs
        # TODO: install JetBrains products
        # TODO: install compilers, languages

        # Applications
        telegram-desktop
        spotify
        vesktop
        # google-chrome # TODO: very buggy
        firefox
    ];
}
