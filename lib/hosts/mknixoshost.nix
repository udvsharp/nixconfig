{ root, inputs, outputs }:

mkHost:
name:
{
    system,
    configuration,
}:

let
    inherit (inputs.nixpkgs) lib;
in mkHost {
    mkSystem = lib.nixosSystem;

    home-manager = inputs.home-manager.nixosModules.home-manager;
} name { inherit system configuration; }
