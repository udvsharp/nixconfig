{ config, lib, pkgs, ... }:

{
    security.rtkit.enable = true;

    services.pipewire = {
        enable = true;

        pulse.enable = true;

        alsa.enable = true;
        alsa.support32Bit = true;
    };

    # PulseAudio should be disabled if Pipewire is enabled
    hardware.pulseaudio.enable = false;
}
