{
    config,
    lib,
    packages,
    ...
}:

{
    nix.settings.experimental-features = [ "nix-command flakes" ];

    # Auto upgrade nix package and the daemon service.
    services.nix-daemon.enable = true;
}