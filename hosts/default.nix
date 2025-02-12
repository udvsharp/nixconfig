{ lib, root, inputs, outputs, }:

let
    inherit (lib.udv) hosts;
in {
    nixosConfigurations = {
        udv-home = hosts.mkNixosHost "udv-home" {
            system = "x86_64-linux";
            configuration = ./nixos/udv-home/configuration.nix;
        };
    };

    # TODO: what to do with darwinPackages
    darwinConfigurations = {
        udv-mac = hosts.mkDarwinHost "udv-mac" {
            system = "aarch64-darwin";
            configuration = ./darwin/udv-mac/configuration.nix;
        };
    };
}