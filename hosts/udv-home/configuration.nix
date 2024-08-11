# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{
    config,
    lib, 
    pkgs,
    nix-version,
    home-manager-module,
    ...
}:

{
    imports = [
        # System
        ./hardware-configuration.nix
        home-manager-module

        ### System Modules
        # Main
        ./modules/system/unused.nix
        ./modules/system/bootloader.nix
        ./modules/system/network.nix
        ./modules/system/firewall.nix
        ./modules/system/gpu.nix
        ./modules/system/audio.nix
        # ./modules/virtualization.nix # TODO: figure out
        ./modules/system/internationalization.nix
        ./modules/system/services.nix
        ./modules/system/console.nix
        ./modules/system/fonts.nix
        # Desktop Environment
        ./modules/system/desktop.nix

        ### Tools and applications
        # Development
        ./modules/tools/cxx.nix
        ./modules/tools/rust.nix
        ./modules/tools/python.nix

        # Users
        ./users.nix

        # Packages
        ./packages.nix
    ];

    # Nix configuration
    nixpkgs.config.allowUnfree = true;

    nix.settings.experimental-features = [ "nix-command flakes" ];

    # System Information
    networking.hostName = "udv-home";

    # TODO: separate datetime file?
    time.timeZone = "Europe/Kyiv";

    # TODO: programs file
    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true;
    # programs.gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };

    # Copy the NixOS configuration file and link it from the resulting system
    # (/run/current-system/configuration.nix). This is useful in case you
    # accidentally delete configuration.nix.
    # 
    # Isn't supported with flakes
    system.copySystemConfiguration = false;

    # This option defines the first version of NixOS you have installed on this particular machine,
    # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
    #
    # Most users should NEVER change this value after the initial install, for any reason,
    # even if you've upgraded your system to a new NixOS release.
    #
    # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
    # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
    # to actually do that.
    #
    # This value being lower than the current NixOS release does NOT mean your system is
    # out of date, out of support, or vulnerable.
    #
    # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
    # and migrated your data accordingly.
    #
    # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
    system.stateVersion = "24.05"; # TODO: variable?
}

