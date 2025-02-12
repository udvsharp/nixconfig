{ root, inputs, outputs }:
{ config, lib, pkgs, ... }@moduleArgs:
let
    patchUser = lib.udv.users.patchUser moduleArgs;
    mkUser    = lib.udv.users.mkUser    moduleArgs patchUser;
in 
hostUsers:

let
    mapFn = configUser: let
        userInfo = {
            inherit (configUser) username;
        };
    in (mkUser userInfo);

    userConfigs = (builtins.map mapFn hostUsers);

    mergedConfig = lib.udv.sets.deepMerge userConfigs;
in {
    users              = mergedConfig.userConfig;
    homeConfigurations = mergedConfig.userHome;
}
