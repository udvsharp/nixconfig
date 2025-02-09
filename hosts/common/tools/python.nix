{ config, lib, pkgs, ... }:

{
    environment.systemPackages = with pkgs.stable; [
        python39
        pipenv
    ];
}