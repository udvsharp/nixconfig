{ root, inputs, outputs }:

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

    stableOverlay = pkgsCommonOverlay {
        package-set-name = "stable";
        input = inputs.nixpkgs-stable;
    };

    unstableOverlay = pkgsCommonOverlay {
        package-set-name = "unstable";
        input = inputs.nixpkgs-unstable;
    };
in final: prev:
    (stableOverlay   final prev)
 // (unstableOverlay final prev)
