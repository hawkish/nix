{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  config = lib.mkIf config.opt.programs.firefox.enable {
    programs.firefox = {
      enable = true;
      profiles = {
        default = {
          id = 0;
          name = "default";
          isDefault = true;
          settings = {
            "browser.startup.homepage" = "https://duckduckgo.com";
            "browser.search.defaultenginename" = "DuckDuckGo";
            "browser.search.order.1" = "DuckDuckGo";
            "signon.rememberSignons" = false;
            "widget.use-xdg-desktop-portal.file-picker" = 1;
            "browser.aboutConfig.showWarning" = false;
            "browser.compactmode.show" = true;
            "browser.cache.disk.enable" = false;
            "widget.disable-workspace-management" = true;
            "mousewheel.default.delta_multiplier_x" = 70;
            "mousewheel.default.delta_multiplier_y" = 70;
            "mousewheel.default.delta_multiplier_z" = 70;
            "browser.newtabpage.pinned" = [
              {
                "label" = "GitHub";
                "url" = "https://github.com";
              }
              {
                "label" = "YouTube";
                "url" = "https://youtube.com";
              }
            ];
          };
          search = {
            force = true;
            default = "DuckDuckGo";
            order = [
              "DuckDuckGo"
              "Google"
            ];
          };
          extensions.packages = with inputs.firefox-addons.packages.${pkgs.system}; [
            firefox
            ublock-origin
          ];
        };
      };
    };
  };

}
