{ config, lib, pkgs, ... }:

{
    # rtkit is optional but recommended
    security.rtkit.enable = true;

    services.pipewire = {
        enable = true;

        pulse.enable = true;

        alsa.enable = true;
        alsa.support32Bit = true;
    };

    # PulseAudio should be disabled if Pipewire is enabled
    hardware.pulseaudio.enable = false;

    # TODO: more detailed setup
    # Sadly, no drivers for my Audient id14
}