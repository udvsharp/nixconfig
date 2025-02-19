{ config, lib, pkgs, ... }@moduleArgs:

let
    mkHostUsers = lib.udv.users.mkHostUsers moduleArgs;
    userConfigurations = (mkHostUsers config.udv.hostUsers);

    protectiveCondition = ((builtins.length config.udv.hostUsers) != 0);
in {
    options.udv.hostUsers = let
        configUserType = lib.types.submodule {
            options = {
                username = lib.mkOption {
                    type = lib.types.str;
                };
            };
        };
    in lib.mkOption {
        type = lib.types.listOf configUserType;
        default = [];
        description = ''
            A list of usernames for this host.
            For each name, we import ./home/<username>
        '';
    };

    options.udv.home.stateVersion = lib.mkOption {
        type = lib.types.str;
        description = ''
            The home state version that should be applied for all users on the given machine
        '';
    };
 
    config.users              = lib.mkIf protectiveCondition userConfigurations.users;
    config.home-manager.users = lib.mkIf protectiveCondition userConfigurations.homeConfigurations;
}
