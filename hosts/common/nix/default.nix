{ config, lib, pkgs, ... }:

{
    imports = [
        ./nix.nix
        ./nix-ld.nix
        ./home.nix
    ];
}