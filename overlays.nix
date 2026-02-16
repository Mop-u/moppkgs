let
    overlays = builtins.mapAttrs (name: value: (final: prev: { "${name}" = value final prev; })) {
        comic-code = final: _: final.callPackage ./pkgs/fonts/comic-code.nix { };
        naturaldocs = final: _: final.callPackage ./pkgs/programs/naturaldocs.nix { };
        slang-lsp-tools = final: _: final.callPackage ./pkgs/programs/slang-lsp-tools.nix { };
        ttf2psf = final: _: final.callPackage ./pkgs/programs/ttf2psf.nix { };
        veadotube = final: _: final.callPackage ./pkgs/programs/veadotube.nix { };
        quartus-prime-pro = final: _: final.callPackage ./pkgs/programs/quartus/quartus-prime-pro.nix { };
        quartus-prime-standard =
            final: _: final.callPackage ./pkgs/programs/quartus/quartus-prime-standard.nix { };
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
