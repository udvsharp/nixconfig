{ root, inputs, outputs }:
{ config, lib, pkgs, ... }@moduleArgs:

userHome: 

let
    patch = {
        home.stateVersion = config.udv.home.stateVersion;
    };
in lib.udv.deepMerge [
    userHome
    patch
]