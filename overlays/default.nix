{ inputs }:

let
    packages = import ./packages.nix { inherit inputs; };
in {
    default = (final: prev: 
           (packages.stableOverlay   final prev)
        // (packages.unstableOverlay final prev)
    );
}