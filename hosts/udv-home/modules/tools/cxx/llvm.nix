{ config, lib, pkgs, ... }:

{
    # TODO: build from source
    environment.systemPackages = with pkgs; [
        # LLVM
        llvmPackages_18.stdenv
        llvmPackages_18.clang
        llvmPackages_18.llvm
        llvmPackages_18.lld
        llvmPackages_18.lldb
    ];
}