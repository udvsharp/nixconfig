{ lib, config, packages, ... }:
# Trying out proper NVIDIA configuration with Wayland
# Xserver will be completely turned off
{
    services.xserver.videoDrivers = [ "nvidia" ];

    # GPU drivers
    hardware.nvidia = {
        # This uses proprietary drivers
        open = false;

        # Custom NVIDIA driver version
        # TODO: version 560.35.03 doesn't build
        package = config.boot.kernelPackages.nvidiaPackages.beta;

        modesetting.enable = true;

        powerManagement = {
            enable = true;

            # Uses PRIME
            finegrained = false;
        };

        # Won't release the device if not in use
        nvidiaPersistenced  = false;

        # PRIME is useful when there's an integrated GPU
        prime = {
            offload.enable = false;
            sync.enable = false;
        };

        # Enable the Nvidia settings menu,
        # accessible via `nvidia-settings`
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

        extraPackages = with packages.stable; [
            mesa.drivers
            nvidia-vaapi-driver
        ];
    };

    # Vulkan
    environment.systemPackages = 
        # Vulkan Packages
        (with packages.stable; [
            vulkan-tools
            vulkan-headers
            vulkan-loader
            vulkan-validation-layers

            vulkan-caps-viewer
        ]) ++ 
        
        # Additional packages
        (with packages.stable; [
            cudatoolkit
            ffmpeg-full # Will be compiled with NVENC support

            nvtopPackages.nvidia
        ]);

    # TODO: setup displays?
}