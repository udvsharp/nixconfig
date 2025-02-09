{ lib, root, inputs, outputs }:

let
    commonArgs = { inherit root inputs outputs; };
in {
    mkUser      = import ./mkuser.nix      commonArgs;
    mkHostUsers = import ./mkhostusers.nix commonArgs;
    patchUser   = import ./patchuser.nix   commonArgs;
}