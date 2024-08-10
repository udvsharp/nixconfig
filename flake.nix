{
    description = "NixOS configuration";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

        home-manager = {
            url = "github:nix-community/home-manager/release-24.05";
            inputs = { nixpkgs.follows = "nixpkgs"; };
        };
    };

    outputs = {
        self,
        nixpkgs,
        home-manager,
        ...
    }@inputs: let
        lib = nixpkgs.lib;

        repo-root = ./.;

        system = "x86_64-linux";
        nix-version = "24.05"; # TODO: not suported in inputs block :(

        home-manager-module = home-manager.nixosModules.default;
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
                };
            };
        };
    };
}