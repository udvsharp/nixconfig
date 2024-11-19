{ package-sets, inputs }:

{
    mkHost = import ./mkhost.nix {
        inherit package-sets inputs;
    };

    mkDarwinHost = import ./mkdarwinhost.nix {
        inherit package-sets inputs;
    };
}