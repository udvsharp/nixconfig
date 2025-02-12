{ root, inputs, outputs }:
{ config, lib, pkgs, ... }@moduleArgs:

userHome: 

let
    inherit (lib.udv) sets;

    patch = {
        home.stateVersion = config.udv.home.stateVersion;
    };
in sets.deepMerge [
    userHome
    patch
]