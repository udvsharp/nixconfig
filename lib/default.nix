{ lib, root, inputs, outputs }:

let
    commonArgs = { inherit lib root inputs outputs; };
in {
    systems = import ./systems commonArgs;
    users   = import ./users   commonArgs;
    hosts   = import ./hosts   commonArgs;
    sets    = import ./sets    commonArgs;
}