{ config, lib, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        gcc13
        gdb
        libgcc
    ];
}