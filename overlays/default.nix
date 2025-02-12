{ root, inputs, outputs }:

let
    commonArgs = { inherit root inputs outputs; };

    packages = import ./packages.nix commonArgs;
    lib      = import ./lib.nix      commonArgs;
in {
    default = (final: prev: 
        (packages final prev)
    );

    udv = {
        nixpkgs-lib = (final: prev:
            (lib final prev)
        );
    };
}