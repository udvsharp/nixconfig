{ config, lib, pkgs, ... }:

{
    environment.systemPackages = with pkgs.stable; [
        gcc13
        gdb
        libgcc
    ];
}