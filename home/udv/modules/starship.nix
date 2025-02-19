{ config, lib, pkgs, dotsrc, ... }:

{
    programs.starship = {
        enable = true;
        package = pkgs.unstable.starship;
    };

    xdg.configFile."starship.toml".source = "${dotsrc}/starship/simple.toml";
}