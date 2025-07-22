{
  services = {
    # ClamAV antivirus service
    clamav = {
      daemon.enable = true;
      updater.enable = true;
    };
  };
}