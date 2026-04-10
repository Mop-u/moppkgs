final: prev:
let
    mkQuartus = final.callPackage ./quartus.nix;
    mkQuartusPackages = builtins.mapAttrs (
        n: v:
        if builtins.isFunction v then
            args: mkQuartus { quartusSource = v args; }
        else
            mkQuartus { quartusSource = v; }
    );
    quartusSources = {
        lite = final.callPackage ./sources/lite.nix { };
        standard = final.callPackage ./sources/standard.nix { };
        pro = final.callPackage ./sources/pro.nix { };
    };
    quartusPackages = builtins.mapAttrs (n: v: mkQuartusPackages v) quartusSources;
in
{
    inherit mkQuartus quartusSources quartusPackages;
    quartus-prime-pro = quartusPackages.pro.latest;
    quartus-prime-standard = quartusPackages.standard.latest;
}
