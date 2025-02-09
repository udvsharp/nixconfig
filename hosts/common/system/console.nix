{ config, lib, pkgs, ... }:

{
    console = {
        enable = true;
    };

    environment.shellAliases = {
        # TODO: FIX THIS
        cmake-find = "cmake --find-package -DNAME=$1 -DCOMPILER_ID=GNU -DLANGUAGE=CXX -DMODE=EXIST";
    };
}