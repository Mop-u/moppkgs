{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  };
  outputs =
    inputs@{ self, nixpkgs, ... }:
    let
      inherit (nixpkgs) lib;
      forEachSystem = systems: f: builtins.foldl' (lib.recursiveUpdate) { } (builtins.map (f) systems);
    in
    (forEachSystem [ "x86_64-linux" ] (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages.${system} = self.overlays.default pkgs pkgs;
      }
    ))
    // {
      overlays = import ./overlays.nix;
    };
}
