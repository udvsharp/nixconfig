{
    config, # TODO: how this propagates?
    lib, # TODO: how this propagates?
    packages,
    ...
}:

{
    imports = [
        ./modules/system.nix

        ./packages.nix
    ];

    security.pam.enableSudoTouchIdAuth = true;

    # Auto upgrade nix package and the daemon service.
    services.nix-daemon.enable = true;
    # nix.package = pkgs.nix;

    nix.linux-builder.enable = true;

    # Create /etc/zshrc that loads the nix-darwin environment.
    programs.zsh.enable = true;  # default shell on catalina
    # programs.fish.enable = true;

    # Set Git commit hash for darwin-version. # TODO: pass this down
    # system.configurationRevision = self.rev or self.dirtyRev or null;

    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    system.stateVersion = 4;

    # The platform the configuration will be used on.
    nixpkgs.hostPlatform = "aarch64-darwin";
}