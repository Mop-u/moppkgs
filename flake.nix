{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  };
  outputs =
    inputs@{ self, nixpkgs, ... }:
    let
      inherit (nixpkgs) lib;
      forEachSystem = systems: f: builtins.foldl' (lib.recursiveUpdate) { } (map (f) systems);
    in
    (forEachSystem [ "x86_64-linux" ] (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      in
      {
        packages.${system} = self.overlays.default pkgs pkgs;
        checks.${system} =
          let
            moppkgs = self.packages.${system};
            inherit (moppkgs) quartusPackages;
          in
          {
            inherit (moppkgs)
              naturaldocs
              ttf2psf
              slang-server
              ;
            quartus-prime-lite = quartusPackages.lite.latest;
            quartus-prime-standard = quartusPackages.standard.latest;
            quartus-prime-pro = quartusPackages.pro.latest;
          };
      }
    ))
    // {
      overlays = import ./overlays.nix;
    };
}
