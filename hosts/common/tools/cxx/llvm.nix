{ config, lib, pkgs, ... }:

{
    # TODO: build from source
    environment.systemPackages = with pkgs.unstable; [
        llvmPackages_19.stdenv
        llvmPackages_19.clang
        llvmPackages_19.clang-tools
        llvmPackages_19.llvm
        llvmPackages_19.lld
        llvmPackages_19.lldb
    ];
}
