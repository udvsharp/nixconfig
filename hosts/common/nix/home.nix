{ config, lib, pkgs, ... }@moduleArgs:

{
    home-manager = {
        useGlobalPkgs = true;
        backupFileExtension = "bk";

        extraSpecialArgs = {
            inherit (moduleArgs) inputs pkgs;
            inherit (moduleArgs) dotsrc;
        };
    };
}