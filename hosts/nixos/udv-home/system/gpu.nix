{ config, lib, pkgs, ... }:
# Trying out proper NVIDIA configuration with Wayland
# Xserver will be completely turned off
let 
    isBefore2411 = lib.versionOlder config.system.nixos.version "24.11";
in 
{
    services.xserver.videoDrivers = [ "nvidia" ];

    # GPU drivers
    hardware.nvidia = {
        # This uses proprietary drivers
        open = false;

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
    hardware.opengl = lib.mkIf isBefore2411 {
        enable = true;
        driSupport = true;       
        driSupport32Bit = true;

        extraPackages = with pkgs.stable; [
            mesa.drivers
            nvidia-vaapi-driver
        ];
    };

    # Vulkan
    environment.systemPackages = 
        # Vulkan Packages
        (with pkgs.stable; [
            glxinfo

            vulkan-tools
            vulkan-headers
            vulkan-loader
            vulkan-validation-layers

            vulkan-caps-viewer
        ]) ++ 
        
        # Additional packages
        (with pkgs.stable; [
            cudatoolkit
            ffmpeg-full # Will be compiled with NVENC support

            nvtopPackages.nvidia
        ]);

    hardware.nvidia-container-toolkit.enable = true;
}