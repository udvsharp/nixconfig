{ lib, root, inputs, outputs, }:

lib.udv.systems.forAllSystems (
    system: let
        pkgs = inputs.nixpkgs.legacyPackages.${system};
        
        commonArgs = { inherit lib root inputs outputs system pkgs; };

        inherit (pkgs) mkShell;
    in {
        default = mkShell (import ./config-dev-shell.nix commonArgs);
    }
)