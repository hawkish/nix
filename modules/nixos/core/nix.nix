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
      inputs.nix-vscode-extensions.overlays.default
    ];
  };
  nix = {
    optimise.automatic = true;
    settings = {
      experimental-features = "nix-command flakes";
    };
  };
}
