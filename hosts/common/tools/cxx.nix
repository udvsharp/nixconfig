{ config, lib, pkgs, ... }:

{
    imports = [
        ./cxx/llvm.nix
        ./cxx/gnu.nix
    ];

    environment.systemPackages = with pkgs.stable; [
        cmake
        valgrind
    ];
}