{ config, lib, pkgs, ... }:

{
    virtualisation = { 
        docker = {
            enable = true;
        };

        virtualbox.host = {
            enable = true;
        };
    };

    users.extraGroups.vboxusers.members = [ "udv" ];
}