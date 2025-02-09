{ config, lib, pkgs, ... }:

{
    environment.systemPackages = with pkgs.stable; [
        lua-language-server
    ];
}