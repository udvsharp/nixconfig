{ config, lib, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        python39
        pipenv
    ];
}