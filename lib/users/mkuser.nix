{ root, inputs, outputs }:
{ config, lib, pkgs, ... }@moduleArgs:

patchUserFn:
{
    username,
}:

let
    homeRoot = "${root}/home";

    commonHome = import "${homeRoot}/common/home.nix"        moduleArgs;
    userHome   = import "${homeRoot}/${username}/home.nix"   moduleArgs;

    # Only config.users.* properties are allowed
    userConfig = import "${homeRoot}/${username}/config.nix" moduleArgs;

    fullHome = lib.udv.sets.deepMerge [
        commonHome
        userHome
    ];
in {
    userConfig             = userConfig;
    userHome.${username}   = patchUserFn fullHome;
}
