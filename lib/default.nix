{ lib, root, inputs, outputs }:

let
    commonArgs = { inherit lib root inputs outputs; };
in {
    users = import ./users commonArgs;
    hosts = import ./hosts commonArgs;
    sets  = import ./sets  commonArgs;
}