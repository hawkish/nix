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
      policies = {
        DontCheckDefaultBrowser = true;
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableFirefoxScreenshots = true;
        TranslateEnabled = false;

        Homepage.StartPage = "previous-session";

        Permissions = {
          Location = {
            BlockNewRequests = true;
          };
        };

        FirefoxSuggest = {
          WebSuggestions = false;
          SponsoredSuggestions = false;
          ImproveSuggest = false;
        };

        EnableTrackingProtection = {
          Value = true;
          Cryptomining = true;
          Fingerprinting = true;
        };

        FirefoxHome = # Make new tab only show search
          {
            Search = true;
            TopSites = false;
            SponsoredTopSites = false;
            Highlights = false;
            Pocket = false;
            SponsoredPocket = false;
            Snippets = false;
          };

        "3rdparty".extensions = {
          "uBlock0@raymondhill.net" = {
            permissions = [ "internal:privateBrowsingAllowed" ];
            origins = [ ];
          };
        };

        ExtensionSettings = {
          # 1Password:
          "{d634138d-c276-4fc8-924b-40a0ea21d284}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/1password-x-password-manager/latest.xpi";
            installation_mode = "force_installed";
          };
        };

      };
      profiles = {
        default = {
          id = 0;
          name = "default";
          isDefault = true;
          settings = {
            "browser.startup.homepage" = "https://google.com";
            "browser.search.defaultenginename" = "Google";
            "browser.search.order.1" = "Google";
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
            "extensions.ublock-origin.enabled" = true;
            # Disable translation prompts
            "browser.translations.enable" = false;
            "browser.translations.automaticallyPopup" = false;
          };
          search = {
            force = true;
            default = "google";
            order = [
              "google"
              "ddg"
            ];
          };
          extensions.packages = with inputs.firefox-addons.packages.${pkgs.system}; [
            ublock-origin
          ];
        };
      };
    };
  };

}
