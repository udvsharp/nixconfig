{ config, lib, pkgs, inputs, ... }:

{
    nix = {
        # This will add each flake input as a registry
        # To make nix3 commands consistent with your flake
        registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

        # This will add your inputs to the system's legacy channels
        # Making legacy nix commands consistent as well, awesome!
        nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;
        
        # Refer to https://jackson.dev/post/nix-reasonable-defaults
        settings = {
            connect-timeout = 5;
            log-lines = 25;
            min-free = 128000000;
            max-free = 1000000000;

            auto-optimise-store = true;
            warn-dirty = false;

            allow-import-from-derivation = true;

            experimental-features = [
                "nix-command"
                "flakes"
            ];
        };
    };
}