{ lib, root, inputs, outputs }:

let
    deepMerge = attrsets: let
        allKeys = lib.unique (builtins.concatLists (map builtins.attrNames attrsets));

        mergeKey = key: let
            values = map (attrset: attrset.${key} or null) attrsets;
            nonNullValues = builtins.filter (v: v != null) values;
        in
            if builtins.all lib.isAttrs nonNullValues then
                deepMerge nonNullValues
            else
                lib.lists.last nonNullValues;
    in
        builtins.listToAttrs (map (key: { name = key; value = mergeKey key; }) allKeys);
in deepMerge