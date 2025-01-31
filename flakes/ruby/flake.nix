{
  description = "Ruby and Nodejs environment";

  inputs = {
    nixpkgs.url = "nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        rubyEnv = pkgs.bundlerEnv {
          # The full app environment with dependencies
          inherit (pkgs) ruby;
          gemdir = ./.; # Points to Gemfile.lock and gemset.nix
        };

        buildPackages = [
          pkgs.bundix
          rubyEnv
          rubyEnv.wrappedRuby
          pkgs.nodejs
        ];
      in
      with pkgs;
      {
        packages.default = stdenv.mkDerivation {
          name = "Setup environment";
          src = ./.;
          buildInputs = buildPackages;
        };
      }
    );
}
