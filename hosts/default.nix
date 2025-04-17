{
  self,
  inputs,
  ...
}:
{
  flake.nixosConfigurations =
    let
      inherit (inputs.nixpkgs.lib) nixosSystem;
      inherit (import "${self}/modules/nixos") default;

      homeImports = import "${self}/home";

      mkHost =
        {
          hostname,
          user ? null,
        }:
        let
          specialArgs =
            {
              inherit inputs self;
            }
            // {
              hostname = hostname;
              user = user;
              homeDir = "/home/${user}";
            };
        in
        nixosSystem {
          inherit specialArgs;
          modules = default ++ [
            ./${hostname}
            (
              if user != null then
                {
                  home-manager = {
                    useUserPackages = true;
                    users.${user}.imports = homeImports.${hostname};
                    extraSpecialArgs = specialArgs;
                  };
                }
              else
                { }
            )
          ];
        };
    in
    {
      nixos = mkHost {
        hostname = "nixos";
        user = "mortenhogh";
      };
    };

  flake.darwinConfigurations =
    let
      inherit (inputs.nix-darwin.lib) darwinSystem;
      inherit (import "${self}/modules/darwin") default;

      homeImports = import "${self}/home";

      mkHost =
        {
          hostname,
          user ? null,
        }:
        let
          specialArgs =
            {
              inherit inputs self;
            }
            // {
              hostname = hostname;
              user = user;
              homeDir = "/Users/${user}";
            };
        in
        darwinSystem {
          inherit specialArgs;

          modules = default ++ [
            inputs.mac-app-util.darwinModules.default
            ./${hostname}
            (
              if user != null then
                {
                  home-manager = {
                    useUserPackages = true;
                    users.${user}.imports = homeImports.${hostname};
                    extraSpecialArgs = specialArgs;
                    sharedModules = [
                      inputs.mac-app-util.homeManagerModules.default
                    ];
                  };
                }
              else
                { }
            )
          ];
        };
    in
    {
      mini = mkHost {
        hostname = "mini";
        user = "mortenhogh";
      };
      laptop = mkHost {
        hostname = "laptop";
        user = "mortenhogh";
      };
      BDM-LW262PK2D3 = mkHost {
        hostname = "BDM-LW262PK2D3";
        user = "mho";
      };

    };
}
