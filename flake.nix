# Entry point, defines all inputs
{
    description = "NixOS configuration";

    # TODO: preprocess this file
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
        nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
        
        home-manager = {
            url = "github:nix-community/home-manager/release-24.11";
            inputs = { nixpkgs.follows = "nixpkgs"; };
        };

        nix-darwin = {
            url = "github:LnL7/nix-darwin";
            inputs = { nixpkgs.follows = "nixpkgs"; };
        };
    };

    outputs = args: import ./main.nix args;
}
