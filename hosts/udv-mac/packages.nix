{ packages, ... }:

{
    environment.systemPackages = with packages; [
        unstable.raycast
    ];
}