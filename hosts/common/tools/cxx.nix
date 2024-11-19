{ config, lib, packages,  ... }:

{
    imports = [
        ./cxx/llvm.nix
        ./cxx/gnu.nix
    ];

    environment.systemPackages = with packages.stable; [
        cmake
        valgrind
    ];
}