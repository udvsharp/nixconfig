{ config, lib, pkgs, ... }:

{
    networking.networkmanager.enable = true;

    systemd.network.wait-online.enable = false;
    boot.initrd.systemd.network.wait-online.enable = false;
}
