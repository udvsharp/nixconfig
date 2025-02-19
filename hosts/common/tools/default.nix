{ config, lib, pkgs, ... }:

{
    imports = [
        ./fish.nix
        ./direnv.nix
        ./nix.nix
        ./lua.nix
        ./python.nix
    ];
}