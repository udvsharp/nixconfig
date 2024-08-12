{ config, lib, pkgs, ... }:

{
    environment.etc."opt/hello".text = ''
        #!/bin/sh
        echo "Hello, world!"
    '';
}