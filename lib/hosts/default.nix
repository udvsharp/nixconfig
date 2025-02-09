{ root, inputs, outputs }:

let
    commonArgs = { inherit root inputs outputs; };
in rec {
    mkHost       = import ./mkhost.nix       commonArgs;
    mkNixosHost  = import ./mknixoshost.nix  commonArgs mkHost;
    mkDarwinHost = import ./mkdarwinhost.nix commonArgs mkHost;
}