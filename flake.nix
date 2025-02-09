{
    description = "NixOS configuration";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

        nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";
        nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

        nixos-hardware.url = "github:NixOS/nixos-hardware";
        
        home-manager = {
            url = "github:nix-community/home-manager/release-24.11";
            inputs = { nixpkgs.follows = "nixpkgs"; };
        };

        nix-darwin = {
            url = "github:LnL7/nix-darwin";
            inputs = { nixpkgs.follows = "nixpkgs"; };
        };
        nixpkgs-darwin.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";


        disko = {
            url = "github:nix-community/disko";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        sops-nix = {
            url = "github:Mic92/sops-nix";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = (args: import ./main.nix args);
}
