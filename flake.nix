{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  };
  outputs =
    { self, nixpkgs, ... }:
    let
      inherit (nixpkgs) lib;
      forEachSystem = systems: f: builtins.foldl' (lib.recursiveUpdate) { } (map f systems);
    in
    (forEachSystem
      [
        "aarch64-darwin"
        "aarch64-linux"
        "i686-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ]
      (
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
                edalize
                leaf
                naturaldocs
                slang-server
                ttf2psf
                ;
              quartus-prime-lite = quartusPackages.lite.latest;
              quartus-prime-pro = quartusPackages.pro.latest;
              quartus-prime-standard = quartusPackages.standard.latest;
            };
        }
      )
    )
    // {
      overlays = import ./overlays.nix;
    };
}
