{ packages, ... }:

{
    virtualisation = { 
        docker = {
            enable = true;
        };

        virtualbox.host = {
            enable = true;
        };
    };

    hardware.nvidia-container-toolkit.enable = true;

    users.extraGroups.vboxusers.members = [ "udv" ];
}