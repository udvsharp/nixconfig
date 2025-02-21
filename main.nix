{
    self,
    nixpkgs,
    nix-darwin,
    ...
}@inputs: let
    root = ./.;

    overlays = import ./overlays {
        inherit root;
        inherit (self) inputs outputs;
    };

    lib = inputs.nixpkgs.lib.extend overlays.udv.nixpkgs-lib;

    moduleArgs = {
        inherit lib root;
        inherit (self) inputs outputs;
    };

    hosts     = import ./hosts  moduleArgs;
    devShells = import ./shells moduleArgs;
in {
    inherit overlays;
    inherit devShells;

    inherit (hosts)
        nixosConfigurations
        darwinConfigurations;
}
