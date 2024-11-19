{ config, lib, packages, ... }:

{
    environment.systemPackages = with packages.stable; [
        gcc13
        gdb
        libgcc
    ];
}