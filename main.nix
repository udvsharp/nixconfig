{
    self,
    nixpkgs,
    nixpkgs-unstable,
    nix-ld-rs,
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
}
