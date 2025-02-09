{ ... }:

let
    vmoptions-contents = builtins.readFile ./template.vmoptions;

    # TODO: finish this
    jetbrains-configure = package: package.overrideAttrs (oldAttrs: {
        installPhase = ''
            cd ${out}
            echo ${vmoptions-contents} > ${out}/vmoptions
        '';
    });
in {
    inherit jetbrains-configure;
}