{ config, packages, inputs, ... }:

{
    programs.nix-ld = {
        enable = true;
        package = inputs.nix-ld-rs.packages.${packages.stable.system}.nix-ld-rs;

        libraries = with packages.stable; [
            stdenv.cc.cc
            zlib
            zstd
            curl
            openssl
            attr
            libssh
            bzip2
            libxml2
            acl
            libsodium
            util-linux
            xz
            systemd

            xorg.libXext
            xorg.libX11
            xorg.libXrender
            xorg.libXtst
            xorg.libXi

            freetype
            fontconfig
        ];
    };
}