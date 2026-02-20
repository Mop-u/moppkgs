final: prev: rec {
    quartusSources = {
        pro = final.callPackage ./sources/pro.nix { };
        lite = final.callPackage ./sources/lite.nix { };
        standard = final.callPackage ./sources/standard.nix { };
    };

    mkQuartus = final.callPackage ./quartus.nix;

    quartus-prime-pro = mkQuartus {
        quartusSource = quartusSources.pro.latest;
    };

    quartus-prime-standard = mkQuartus {
        quartusSource = quartusSources.standard.latest;
    };

}
