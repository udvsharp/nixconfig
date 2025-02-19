{ config, lib, pkgs, outputs, spec, home-manager, ... }:

# Learned a lot from exploring https://github.com/EmergentMind/nix-config
{
    networking.hostName = spec.hostname;

    nixpkgs = {
        overlays = [
            outputs.overlays.default
        ];
        config = {
            allowUnfree = true;
            allowBroken = false;
        };
    };
    
    imports = [
        home-manager

        ./nix
        ./system
        ./desktop
        ./tools

        ./users.nix
        ./packages.nix
    ];
}