{ config, lib, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        unstable.telegram-desktop
        unstable.efibootmgr
        unstable.logiops
    ]; 
}
