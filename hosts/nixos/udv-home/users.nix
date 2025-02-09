{ config, lib, pkgs, dotsrc, ... }:

{
    config.udv.hostUsers = [ 
        { username = "udv"; }
    ];
}