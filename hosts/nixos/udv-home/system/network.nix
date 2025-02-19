{ config, lib, pkgs, ... }:

{
    # TODO: any way of determining connection type?
    #       or supporting both?
    # Pick only one of the below networking options.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

    systemd.network.wait-online.enable = false;
    boot.initrd.systemd.network.wait-online.enable = false;
}