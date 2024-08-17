{ config, lib, packages, ... }:

{
    imports = [
        # ./jetbrains/override.nix # TODO: doesn't work for now
    ];

    home.packages = with packages.stable.jetbrains; [
        clion
        rust-rover
    ];
}