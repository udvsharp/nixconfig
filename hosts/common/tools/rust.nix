{ config, lib, packages, ... }:

{
    environment.systemPackages = with packages.stable; [
        rustup
    ];
}