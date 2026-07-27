let
  overlays =
    (builtins.mapAttrs (name: value: (final: prev: { "${name}" = value final prev; })) {
      leaf-markdown = final: _: final.callPackage ./pkgs/leaf.nix { };
      comic-code = final: _: final.callPackage ./pkgs/comic-code.nix { };
      edalize = final: _: final.callPackage ./pkgs/edalize.nix { };
      naturaldocs = final: _: final.callPackage ./pkgs/naturaldocs.nix { };
      slang-server = final: _: final.callPackage ./pkgs/slangServer/slangServer.nix { };
      ttf2psf = final: _: final.callPackage ./pkgs/ttf2psf.nix { };
      veadotube = final: _: final.callPackage ./pkgs/veadotube.nix { };
    })
    // {
      quartus = import ./pkgs/quartus/overlay.nix;
    };

  composeExtensions =
    acc: elem: final: prev:
    let
      applied = acc final prev;
      prev' = prev // applied;
    in
    applied // (elem final prev');

  composeManyExtensions = builtins.foldl' composeExtensions (_: _: { });

  default = composeManyExtensions (builtins.attrValues overlays);
in
overlays // { inherit default; }
