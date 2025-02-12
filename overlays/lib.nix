{ root, inputs, outputs }:

final: prev: {
    udv = (prev.udv or {}) // import "${root}/lib" {
        # This way you can access extended lib functions
        # inside the extended lib itself
        lib = final;
        inherit root inputs outputs;
    };
}
