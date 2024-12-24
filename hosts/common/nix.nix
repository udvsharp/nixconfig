{
    config,
    lib,
    packages,
    ...
}:

{
    nix.settings.experimental-features = [ "nix-command flakes" ];
}