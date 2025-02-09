{
    self,
    nixpkgs,
    nix-darwin,
    ...
}@inputs: let
    root = ./.;

    udv = import ./lib/hosts {
        inherit root;
        inherit (self) inputs outputs;
    };
in {
    overlays = import ./overlays { inherit inputs; };

    nixosConfigurations = {
        udv-home = udv.mkNixosHost "udv-home" {
            system = "x86_64-linux";
            configuration = ./hosts/nixos/udv-home/configuration.nix;
        };
    };

    # TODO: what to do with darwinPackages
    darwinConfigurations = {
        udv-mac = udv.mkDarwinHost "udv-mac" {
            system = "aarch64-darwin";
            configuration = ./hosts/darwin/udv-mac/configuration.nix;
        };
    };
}
