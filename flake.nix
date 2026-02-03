{
    inputs = { };
    outputs =
        { self, ... }@inputs:
        {
            overlays = import ./overlays.nix;
        };
}
