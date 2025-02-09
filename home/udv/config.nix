{ config, lib, pkgs, ... }:

{
    users.udv = {
        isNormalUser = true;
        description = "Dmitry Vasyliev";
        extraGroups = [ "networkmanager" "wheel" "docker" ];
    };
}
