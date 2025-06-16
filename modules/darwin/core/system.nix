{ self, user, ... }:
{
  system = {
    primaryUser = user;
    stateVersion = 6;
    configurationRevision = self.rev or self.dirtyRev or null;
    defaults = {
      finder.AppleShowAllExtensions = true;
      # List view in Finder
      finder.FXPreferredViewStyle = "Nlmv";
      NSGlobalDomain.AppleInterfaceStyle = "Dark";
      ".GlobalPreferences"."com.apple.mouse.scaling" = 1.0;
      NSGlobalDomain.NSScrollAnimationEnabled = false;
      #loginwindow.PowerOffDisabledWhileLoggedIn = true;
    };
  };
}
