{ config, lib, pkgs, dotsrc, ... }:

{
    programs.starship = {
        enable = true;
        package = pkgs.unstable.starship;
    };

    home.file.".config/starship.toml".source = "${dotsrc}/starship/simple.toml";
    # TODO: move this to bash config? TODO: option useStarship?
    home.file.".bashrc".text = ''
        eval "$(starship init bash)"
    '';
}