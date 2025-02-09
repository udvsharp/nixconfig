{ inputs }:

let
    pkgsCommonOverlay = { package-set-name, input }: (final: prev: {
        "${package-set-name}" = import input {
            inherit (final) system;
            config = {
                allowUnfree = true;
                allowBroken = false;
            };
        };
    });
in {
    stableOverlay = pkgsCommonOverlay {
        package-set-name = "stable";
        input = inputs.nixpkgs-stable;
    };

    unstableOverlay = pkgsCommonOverlay {
        package-set-name = "unstable";
        input = inputs.nixpkgs-unstable;
    };
}
