{ lib, root, inputs, outputs }:

let
    commonArgs = { inherit lib root inputs outputs; };
in {
    users = import ./users commonArgs;

    deepMerge = import ./deepmerge.nix commonArgs;
}