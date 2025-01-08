{
  self,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    "${self}/modules/home"
  ];

  home = {
    username = "mortenhogh";
    homeDirectory = "/Users/mortenhogh";
    stateVersion = "24.05";
  };

  nixpkgs.overlays = [ inputs.nixpkgs-firefox-darwin.overlay ];

  programs = {
    firefox = {
      enable = true;
      package = pkgs.firefox-bin;

      profiles = {
        default = {
          id = 0;
          name = "default";
          isDefault = true;
          settings = {
            "browser.startup.homepage" = "https://DuckDuckGo.com";
            "browser.search.defaultenginename" = "DuckDuckGo";
            "browser.search.order.1" = "DuckDuckGo";

            # Disable irritating first-run stuff
            "browser.disableResetPrompt" = true;
            "browser.download.panel.shown" = true;
            "browser.feeds.showFirstRunUI" = false;
            "browser.messaging-system.whatsNewPanel.enabled" = false;
            "browser.rights.3.shown" = true;
            "browser.shell.checkDefaultBrowser" = false;
            "browser.shell.defaultBrowserCheckCount" = 1;
            "browser.startup.homepage_override.mstone" = "ignore";
            "browser.uitour.enabled" = false;
            "startup.homepage_override_url" = "";
            "trailhead.firstrun.didSeeAboutWelcome" = true;
            "browser.bookmarks.restore_default_bookmarks" = false;
            "browser.bookmarks.addedImportButton" = true;
          };
          search = {
            force = true;
            default = "DuckDuckGo";
            order = [
              "DuckDuckGo"
              "Google"
            ];
          };
          bookmarks = { };
        };
      };
    };
  };

}
