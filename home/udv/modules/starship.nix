{ config, lib, pkgs, dotsrc, ... }:

{
    programs.starship = {
        enable = true;
        package = pkgs.unstable.starship;

        enableBashIntegration = true;
        enableFishIntegration = true;
    };

    xdg.configFile."starship.toml".source = "${dotsrc}/starship/simple.toml";
}