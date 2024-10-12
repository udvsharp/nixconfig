{ package-sets, inputs }:

name:
{
    system,
    configuration,
}:

let
    dotsrc = ../packages;
    lib =  package-sets.stable.lib;

    packages = import ./packages.nix {
        inherit package-sets inputs system;
    };

    home-manager = inputs.home-manager.nixosModules;

    mkSystem = lib.nixosSystem;
in mkSystem {
    inherit system;

    modules = [
        home-manager.default # TODO: can setup here?
        configuration
    ];

    specialArgs = {
        inherit inputs;
        inherit packages;
        inherit dotsrc;
    };
}