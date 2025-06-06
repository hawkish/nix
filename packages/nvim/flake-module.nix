{ self, inputs, ... }:
{
  flake = {
    # The nixvim module used to build `packages.<system>.nvim`
    nixvimModules.default = import ./config;
  };

  perSystem =
    {
      self',
      pkgs,
      system,
      config,
      ...
    }:
    let
      inherit (inputs.nixvim.legacyPackages.${system}) makeNixvimWithModule;
      inherit (inputs.nixvim.lib.${system}.check) mkTestDerivationFromNvim;

      # Create a custom nixpkgs instance with allowUnfree enabled
      pkgsUnfree = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      # Run using `nix run .#nvim`
      packages = {
        nvim = makeNixvimWithModule {
          pkgs = pkgsUnfree; # Use the unfree-enabled pkgs
          module = self.nixvimModules.default;
          extraSpecialArgs = { inherit self inputs; };
        };
        
        # Personal Neovim variant - with claude-code enabled
        nvim-personal = makeNixvimWithModule {
          pkgs = pkgsUnfree;
          module = { lib, ... }: {
            imports = [ self.nixvimModules.default ];
            config.opt.features.personal.enable = true; 
          };
          extraSpecialArgs = { inherit self inputs; };
        };
        
        # Work Neovim variant - without claude-code
        nvim-work = makeNixvimWithModule {
          pkgs = pkgsUnfree;
          module = { lib, ... }: {
            imports = [ self.nixvimModules.default ];
            config.opt.features.personal.enable = false;
          };
          extraSpecialArgs = { inherit self inputs; };
        };
      };

      # `nix flake check` will also validate config
      checks.nvim = mkTestDerivationFromNvim {
        nvim = self'.packages.nvim;
        name = "My custom neovim";
      };
      debug = true;
    };
}
