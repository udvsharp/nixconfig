{ lib, root, inputs, outputs }:

{ 
    mkSystem,
    home-manager,
}:

name:
{
    system,
    configuration,
}:

let
    hostSpec = {
        hostname = name;
    };
in mkSystem {
    inherit system;

    modules = let 
        common = "${root}/hosts/common";
    in [
        common
        home-manager
        configuration
    ];

    specialArgs = let 
        dotsrc = "${root}/dotfiles";
    in {
        spec = hostSpec;

        inherit home-manager;

        inherit lib;

        inherit inputs outputs;
        inherit root dotsrc;
    };
}