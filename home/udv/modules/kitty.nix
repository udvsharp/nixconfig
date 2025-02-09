{ config, lib, pkgs, dotsrc, ... }:

{
    programs.kitty = {
        enable = true;
        package = pkgs.unstable.kitty;
    };

    # home.file.".config/kitty" = {
    #     source = lib.filesystem.mkOutOfStoreSymlink "${dotsrc}/kitty";
    # };
}