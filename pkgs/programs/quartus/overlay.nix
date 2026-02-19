final: prev: rec {
    quartusSources = {
        pro = final.callPackage ./sources/pro.nix { };
        lite = final.callPackage ./sources/lite.nix { };
        standard = final.callPackage ./sources/standard.nix { };
    };

    quartus-prime-pro = final.callPackage ./quartus.nix {
        quartusSource = quartusSources.pro."25.3.0.109";
    };

    quartus-prime-standard = final.callPackage ./quartus.nix {
        quartusSource = quartusSources.standard."23.1std.1.993";
    };
}
