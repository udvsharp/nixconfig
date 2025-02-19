{ config, lib, pkgs, dotsrc, ... }:

{
    programs.kitty = {
        enable = true;
        package = pkgs.unstable.kitty;
    };

    xdg.configFile."kitty".source = builtins.path {
        path = "${dotsrc}/kitty";
        name = "udv-kitty-config";
    };
}