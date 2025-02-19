{ config, lib, pkgs, ... }:

{
    programs.bash = {
        interactiveShellInit = ''
            if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
            then
                shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
                exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
            fi
        '';
    };

    programs.fish = {
        enable = true;
        # For some reason doesn't work in 24.11 whithout it
        shellInit = ''
            starship init fish | source
        '';
    };

    environment.systemPackages = with pkgs.unstable.fishPlugins; [
        done
        fzf-fish
        forgit
        grc
    ];
}