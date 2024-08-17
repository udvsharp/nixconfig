{
    config,
    lib,
    packages,
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
        };
        
        # Passing through packages
        useGlobalPkgs = false;
        useUserPackages = true;

        users = {
            udv = import ./users/udv/home.nix;
        };
    };
}