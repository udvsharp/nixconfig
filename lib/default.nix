{ package-sets, inputs }:

{
    mkHost = import ./mkhost.nix {
        inherit package-sets inputs;
    };
}