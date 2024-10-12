{ config, packages, dotsrc, ... }:

{
    programs.starship = {
        enable = true;
        package = packages.unstable.starship;
    };

    home.file.".config/starship.toml".source = "${dotsrc}/starship/starship.toml";
    # TODO: move this to bash config? TODO: option useStarship?
    home.file.".bashrc".text = ''
        eval "$(starship init bash)"
    '';
}