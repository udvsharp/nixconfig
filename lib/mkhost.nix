{ package-sets, inputs }:

name:
{
    system,
    configuration,
}:

let
    dotsrc = ../packages;
    root = ../.;
    lib =  package-sets.stable.lib;

    packages = import ./packages.nix {
        inherit package-sets inputs system;
    };

    home-manager = inputs.home-manager.nixosModules;

    mkSystem = lib.nixosSystem;
in mkSystem {
    inherit system;

    modules = [
        home-manager.default
        configuration

        # Common modules
        "${root}/hosts/common"
    ];

    specialArgs = {
        inherit inputs;
        inherit packages;
        inherit dotsrc;
    };
}