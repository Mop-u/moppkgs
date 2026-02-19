final: prev: rec {
    quartusSources = {
        pro = final.callPackage ./sources/pro.nix { };
        lite = final.callPackage ./sources/lite.nix { };
        standard = final.callPackage ./sources/standard.nix { };
    };

    mkQuartus = final.callPackage ./quartus.nix;

    quartus-prime-pro = mkQuartus {
        quartusSource = quartusSources.pro."25.3.0.109";
    };

    quartus-prime-standard = mkQuartus {
        quartusSource = quartusSources.standard."23.1std.1.993";
    };

}
