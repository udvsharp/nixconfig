{ lib, root, inputs, outputs }:

let
    supportedSystems = [
        "aarch64-linux"
        "x86_64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
    ];
in rec {
    forSystems    = lib.genAttrs;
    forAllSystems = (forSystems supportedSystems);
}