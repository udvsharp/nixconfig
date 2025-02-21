{ lib, root, inputs, outputs, system, pkgs }:

{
    name = "udv-nixconfig-shell";
    shellHook = ''
    '';

    packages = with pkgs; [
        python3
    ];
}