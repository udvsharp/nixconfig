{ config, lib, packages, ... }:

{
    # TODO: build from source
    environment.systemPackages = with packages.unstable; [
        # LLVM
        llvmPackages_19.stdenv
        llvmPackages_19.clang
        llvmPackages_19.clangd
        llvmPackages_19.llvm
        llvmPackages_19.lld
        llvmPackages_19.lldb
    ];
}
