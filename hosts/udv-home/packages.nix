{ packages, ... }:

{
    environment.systemPackages = with packages; [
        unstable.telegram-desktop
        unstable.efibootmgr # TODO: linux hosts only
        unstable.logiops # TODO: linux hosts only
    ]; 
}
