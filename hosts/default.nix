{
  self,
  lib,
  inputs,
  ...
}:
{
  flake.nixosConfigurations =
    let
      inherit (inputs.nixpkgs.lib) nixosSystem;
      inherit (import "${self}/modules/nixos") default;

      homeImports = import "${self}/home";

      specialArgs = {
        inherit inputs self;
      };

      mkHost =
        {
          hostname,
          user ? null,
        }:
        nixosSystem {
          inherit specialArgs;
          modules = default ++ [
            ./${hostname}
            (
              if user != null then
                {
                  home-manager = {
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
}
