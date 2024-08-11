{ lib, config, pkgs, pkgs-unstable, ... }:
# Trying out proper NVIDIA configuration with Wayland
# Xserver will be completely turned off
{
    # TODO: unstable branch
    # hardware.graphics.enable = true;

    # Enable VA-API (Video Acceleration API) support
    # TODO: no option like this, research

    services.xserver.videoDrivers = [ "nvidia" ];

    # GPU drivers
    hardware.nvidia = {
        # This uses proprietary driver
        open = false;

        # Custom NVIDIA driver version
        # TODO: version 560.31.02 doesn't build
        package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
            version = "555.58.02";
            sha256_64bit = "sha256-xctt4TPRlOJ6r5S54h5W6PT6/3Zy2R4ASNFPu8TSHKM=";
            sha256_aarch64 = lib.fakeSha256;
            openSha256 = lib.fakeSha256;
            settingsSha256 = "sha256-ZpuVZybW6CFN/gz9rx+UJvQ715FZnAOYfHn5jt5Z2C8=";
            persistencedSha256 = lib.fakeSha256;
        };

        modesetting.enable = true;

        # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
        # Enable this if you have graphical corruption issues or application crashes after waking
        # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
        # of just the bare essentials.
        powerManagement.enable = true;
        # TODO: more config for power management needed, postponing
        powerManagement.finegrained = false;
        nvidiaPersistenced  = false;

        # TODO: offload also should be configured properly
        # prime = {
            # offload.enable = true;
        # };

        # Enable the Nvidia settings menu,
        # accessible via `nvidia-settings`
        # TODO: says XDG_RUNTIME_DIR not set
        nvidiaSettings = true;
    };

    # Additional boot configuration
    boot.kernelModules = [
        "nvidia"         # Nvidia driver
        "nvidia_modeset" # MVIDIA driver will handle mode settings
        "nvidia_uvm"     # Nvidia Unified Memory - mostly for computing with CUDA
        "nvidia_drm"     # Integration with DRM (Direct Rendering Manager)
                         # Helpful for Wayland
    ];

    boot.blacklistedKernelModules = [
        "nouveau" # Blacklist the open-source driver
    ];

    boot.kernelParams = [
        "nvidia-drm.modeset=1" # Mode setting should be enabled right away, crucial for Wayland
    ];

    ### Graphics APIs
    # OpenGL
    hardware.opengl = {
        enable = true;
        driSupport = true;       
        driSupport32Bit = true;
    };

    # Vulkan
    environment.systemPackages = (with pkgs; [
        vulkan-tools
        vulkan-headers
        vulkan-loader
        vulkan-validation-layers

        vulkan-caps-viewer
    ]) ++ 
    
    # Additional packages
    (with pkgs; [
        cudatoolkit
        ffmpeg-full # Will be compiled with NVENC support
    ]);

    # TODO: setup displays?
}