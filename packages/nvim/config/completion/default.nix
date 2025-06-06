{
  config,
  lib,
  ...
}:
{
  imports = [
    ./cmp.nix
    ./lspkind.nix
    ./luasnip.nix
    ./schemastore.nix
  ] ++ lib.optionals (config.opt.features.work.enable) [
    ./cmp-copilot.nix
    ./copilot-chat.nix
  ];
}