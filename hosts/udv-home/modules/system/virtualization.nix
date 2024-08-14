{ pkgs, ... }:

{
    virtualisation = { 
        docker = {
            enable = true;
            enableNvidia = true;
        };
    };

    hardware.nvidia-container-toolkit.enable = true;
}