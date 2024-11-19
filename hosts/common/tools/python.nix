{ config, lib, packages, ... }:

{
    environment.systemPackages = with packages.stable; [
        python39
        pipenv
    ];
}