{
    config,
    lib,
    pkgs,
    home-manager-module,
    ...
}:

{
    # TODO: move this to home manager config
    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.udv = {
        isNormalUser = true;
        description = "Dmitry Vasyliev";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [];
    };

    home-manager = {
        extraSpecialArgs = {
            inherit home-manager-module;
        };
        
        useGlobalPkgs = true;
        useUserPackages = true;

        users = {
            udv = import ./users/udv/home.nix;
        };
    };
}