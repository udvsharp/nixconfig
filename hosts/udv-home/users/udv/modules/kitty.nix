{ config, packages, dotsrc, ... }:

{
    programs.kitty = {
        enable = true;
        package = packages.unstable.kitty;
    };

    home.file.".config/kitty".source = "${dotsrc}/kitty";
}