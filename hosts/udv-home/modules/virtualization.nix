{ pkgs, ... }:

{
    virtualisation = { 
        docker = {
            enable = true;
            package = pkgs.docker_25;

            storageDriver = "btrfs";
        };
    };

    hardware.nvidia-container-toolkit.enable = true;
}