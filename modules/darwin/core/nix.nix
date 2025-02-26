{
  nix = {
    enable = false;
    settings = {
      experimental-features = "nix-command flakes";
    };
  };
}
