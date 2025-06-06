{ lib, ... }:
{
  # Define the options structure to match the system options
  options.opt.features.personal.enable = lib.mkOption {
    type = lib.types.bool;
    default = true; # Default to enabled for simplicity
    description = "Enable personal features in Neovim";
  };
}