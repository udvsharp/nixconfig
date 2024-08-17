{ package-sets, inputs, system }:

let
    commonImportArgs = {
        inherit system;
        config = {
            allowUnfree = true;
            allowBroken = false;
        };
    };
in { # TODO: figure out if this possible without an import
    stable = import package-sets.stable commonImportArgs;
    unstable = import package-sets.unstable commonImportArgs;
}