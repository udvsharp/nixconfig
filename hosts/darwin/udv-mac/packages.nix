{ config, lib, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        unstable.raycast

        stable.telegram-desktop
    ];
}