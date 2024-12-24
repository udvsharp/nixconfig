{ packages, ... }:

{
    # TODO: move this to default.nix
    imports = [
        ./nix.nix
        ./packages.nix

        ./tools/nix.nix
        ./tools/cxx.nix
        ./tools/rust.nix
        ./tools/python.nix
    ];

    # TODO: move
    environment.systemPackages = with packages.stable; [
        lua-language-server
    ];
}