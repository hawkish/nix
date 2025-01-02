{ self, ... }:
{
  system = {
    stateVersion = 5;
    configurationRevision = self.rev or self.dirtyRev or null;
    keyboard = {
    };
    defaults = {
      finder.AppleShowAllExtensions = true;
      finder.FXPreferredViewStyle = "clmv";
      NSGlobalDomain.AppleInterfaceStyle = "Dark";
      ".GlobalPreferences"."com.apple.mouse.scaling" = 1.0;
      NSGlobalDomain.NSScrollAnimationEnabled = false;
      loginwindow.PowerOffDisabledWhileLoggedIn = true;
    };
  };
}
