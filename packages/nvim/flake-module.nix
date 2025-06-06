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
          extraSpecialArgs = { 
            inherit self inputs; 
            isPersonal = false;
            isWork = false;
          };
        };
        
        # Personal Neovim variant - with claude-code enabled
        nvim-personal = makeNixvimWithModule {
          pkgs = pkgsUnfree;
          module = self.nixvimModules.default;
          extraSpecialArgs = { 
            inherit self inputs; 
            isPersonal = true;
            isWork = false;
          };
        };
        
        # Work Neovim variant - without claude-code, with copilot
        nvim-work = makeNixvimWithModule {
          pkgs = pkgsUnfree;
          module = self.nixvimModules.default;
          extraSpecialArgs = { 
            inherit self inputs; 
            isPersonal = false;
            isWork = true;
          };
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
