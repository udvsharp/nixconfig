{ packages, ... }:

{
    environment.systemPackages = with packages; [
        unstable.raycast

        stable.telegram-desktop
    ];
}