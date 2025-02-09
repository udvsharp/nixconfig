{ config, lib, pkgs, ... }:

{
    imports = [
        ./unused.nix
        ./bootloader.nix
        ./network.nix
        ./firewall.nix
        ./gpu.nix
        ./audio.nix
        ./virtualization.nix
        ./services.nix
    ];
}