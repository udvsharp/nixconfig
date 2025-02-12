{ lib, root, inputs, outputs }:

mkHost:
name:
{
    system,
    configuration,
}:

let
    inherit (inputs.nix-darwin) lib;
in mkHost {
    mkSystem = lib.darwinSystem;

    home-manager = null;
} name { inherit system configuration; }
