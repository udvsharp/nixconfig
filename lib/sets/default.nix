{ lib, root, inputs, outputs }:

let
    commonArgs = { inherit lib root inputs outputs; };
in {
    deepMerge = import ./deepmerge.nix commonArgs;
}