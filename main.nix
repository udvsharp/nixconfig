# Main file, defines outputs of whole repository
{
    self,
    nixpkgs,
    nixpkgs-unstable,
    nix-ld-rs,
    nix-darwin,
    ...
}@inputs: let
    udv = import ./lib {
        package-sets = {
            stable = nixpkgs;
            unstable = nixpkgs-unstable;
        };

        inherit inputs;
    };
in {
    nixosConfigurations = {
        udv-home = udv.mkHost "udv-home" {
            system = "x86_64-linux";
            configuration = ./hosts/udv-home/configuration.nix;
        };
    };

    # TODO: what to do with darwinPackages
    darwinConfigurations = {
        udv-mac = udv.mkDarwinHost "udv-mac" {
            system = "aarch64-darwin";
            configuration = ./hosts/udv-mac/configuration.nix;
        };
    };
}
