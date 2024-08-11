{
    description = "NixOS configuration";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

        nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager/release-24.05";
            inputs = { nixpkgs.follows = "nixpkgs"; };
        };
    };

    outputs = {
        self,
        nixpkgs,
        nixpkgs-unstable,
        home-manager,
        ...
    }@inputs: let
        repo-root = ./.;

        system = "x86_64-linux";
        nix-version = "24.05"; # TODO: not suported in inputs block :(

        home-manager-module = home-manager.nixosModules.default;

        lib = nixpkgs.lib;
        pkgs = nixpkgs.legacyPackages.${system};
        pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
    in {
        nixosConfigurations = {
            udv-home = lib.nixosSystem { # TODO: foreach in hosts directory?
                inherit system;

                modules = [
                    home-manager-module
                    ./hosts/udv-home/configuration.nix
                ];

                specialArgs = {
                    inherit inputs nix-version self repo-root home-manager-module;
                    inherit pkgs-unstable;
                };
            };
        };
    };
}