{ lib, config, pkgs, pkgs-unstable, ... }:
# Trying out proper NVIDIA configuration with Wayland
# Xserver will be completely turned off
{
    services.xserver.videoDrivers = [ "nvidia" ];

    # GPU drivers
    hardware.nvidia = {
        # This uses proprietary driver
        open = false;

        # Custom NVIDIA driver version
        # TODO: version 560.31.02 doesn't build
        package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
            version = "560.31.02";
            sha256_64bit = "sha256-0cwgejoFsefl2M6jdWZC+CKc58CqOXDjSi4saVPNKY0=";
            sha256_aarch64 = lib.fakeSha256;
            openSha256 = lib.fakeSha256;
            settingsSha256 = "sha256-A3SzGAW4vR2uxT1Cv+Pn+Sbm9lLF5a/DGzlnPhxVvmE=";
            persistencedSha256 = lib.fakeSha256;
        };

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
        # TODO: says libEGL is not installed
        # TODO: also won't build in 560.31.02 because can't find vulkan
        nvidiaSettings = false;
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

        extraPackages = with pkgs; [
            nvidia-vaapi-driver
        ];
    };

    # Vulkan
    environment.systemPackages = 
        # Vulkan Packages
        (with pkgs; [
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

            nvtopPackages.nvidia
        ]);

    # TODO: setup displays?
}