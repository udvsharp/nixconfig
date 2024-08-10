{ config, lib, pkgs, ... }:

{
    imports = [
        ./cxx/llvm.nix
        # ./cxx/gnu.nix # TODO: conflicts with llvm for now
    ];

    home.packages = with pkgs; [
        cmake
        valgrind
    ];
}