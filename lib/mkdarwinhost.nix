{ package-sets, inputs, nix-darwin }:

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

    mkSystem = nix-darwin.lib.darwinSystem;
in mkSystem {
    inherit system;

    # TODO: darwinPackages exposer somehow?
    
    modules = [
        home-manager.default # TODO: can setup here?
        configuration

        # Common modules
        "${root}/hosts/common/nix.nix"
        "${root}/hosts/common/packages.nix"
    ];

    specialArgs = {
        inherit inputs;
        inherit packages;
        inherit dotsrc;
    };
}