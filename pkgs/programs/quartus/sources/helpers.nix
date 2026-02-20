rec {
    toSemVer =
        version:
        builtins.concatStringsSep "" (builtins.match "^([0-9]+\.[0-9]+)[std]*(\.[0-9]+).*" version);
    hasDevices =
        source:
        builtins.foldl' (acc: elem: acc && (builtins.hasAttr elem source.devices)) (source.devices != { });
    sortSources = builtins.sort (
        p: q: (builtins.compareVersions (toSemVer p.version) (toSemVer q.version)) == 1
    );
    getLatest = sources: builtins.head (sortSources sources);
    byVersion =
        sources:
        builtins.listToAttrs (
            builtins.map (x: {
                name = x.version;
                value = x;
            }) sources
        );
    getLatestWithDevices =
        sources: devices:
        (getLatest (builtins.filter (x: hasDevices x devices) sources)) // { defaultDevices = devices; };
    mkVariants = variant: builtins.map (x: (x // { inherit variant; }));

    setupSources =
        sources:
        (byVersion sources)
        // {
            latest = getLatest sources;
            latestWithDevices = getLatestWithDevices sources;
        };
}
