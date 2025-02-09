{ config, lib, pkgs, ... }:

{
    imports = [
        ./time.nix
        ./locale.nix
        ./fonts.nix
        ./console.nix
    ];
}