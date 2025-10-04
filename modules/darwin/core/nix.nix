{ inputs, ... }:
{
  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      (self: _super: {
        unstable = import inputs.nixpkgs-unstable {
          inherit (self) system;
          config.allowUnfree = true;
        };
      })
    ];
  };
  nix = {
    settings = {
      experimental-features = "nix-command flakes";
    };
  };
}
