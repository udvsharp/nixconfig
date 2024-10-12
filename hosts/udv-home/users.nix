{
    config,
    lib,
    packages,
    dotsrc,
    ...
}:

{
    # TODO: move this to home manager config
    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.udv = {
        isNormalUser = true;
        description = "Dmitry Vasyliev";
        extraGroups = [ "networkmanager" "wheel" "docker" ];
        packages = with packages.stable; [];
    };

    home-manager = {
        extraSpecialArgs = {
            inherit packages;
            inherit dotsrc;
        };
        
        # Passing through packages
        useGlobalPkgs = false;
        useUserPackages = true;

        backupFileExtension = ".bk";

        users = {
            udv = import ./users/udv/home.nix;
        };
    };
}