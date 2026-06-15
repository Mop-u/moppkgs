let
  overlays =
    (builtins.mapAttrs (name: value: (final: prev: { "${name}" = value final prev; })) {
      comic-code = final: _: final.callPackage ./pkgs/fonts/comic-code.nix { };
      edalize = final: _: final.callPackage ./pkgs/programs/edalize.nix { };
      naturaldocs = final: _: final.callPackage ./pkgs/programs/naturaldocs.nix { };
      slang-server = final: _: final.callPackage ./pkgs/programs/slangServer.nix { };
      ttf2psf = final: _: final.callPackage ./pkgs/programs/ttf2psf.nix { };
      veadotube = final: _: final.callPackage ./pkgs/programs/veadotube.nix { };
    })
    // {
      quartus = import ./pkgs/programs/quartus/overlay.nix;
    };

  composeExtensions =
    acc: elem: final: prev:
    let
      applied = acc final prev;
      prev' = prev // applied;
    in
    applied // (elem final prev');

  composeManyExtensions = builtins.foldl' (composeExtensions) (_: _: { });

  default = composeManyExtensions (builtins.attrValues overlays);
in
overlays // { inherit default; }
