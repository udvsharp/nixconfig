{ config, lib, pkgs, ... }:

{
    environment.systemPackages = with pkgs.stable; [
        rustup
    ];
}