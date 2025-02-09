{ root, inputs, outputs }:

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
    inherit (inputs) nixpkgs;

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
        extLibModule = "${root}/lib";
        dotsrc       = "${root}/dotfiles";
    in {
        spec = hostSpec;

        inherit home-manager;

        lib = let
            extendedLib = import extLibModule {
                inherit (nixpkgs) lib;
                inherit root inputs outputs;
            };
        in nixpkgs.lib.extend
            (final: prev: { udv = extendedLib; });

        inherit inputs outputs;
        inherit root dotsrc;
    };
}