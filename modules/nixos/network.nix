{ ... }: {
  networking.networkmanager.enable = true;

  # networking.dhcpcd.enable = false;
  # networking.wireless.iwd = {
  #   enable = true;
  #   settings.General.EnableNetworkConfiguration = false;
  # };
  # networking.useDHCP = false;
  # networking.useNetworkd = true;
  # systemd.network.networks."25-wireless" = {
  #   matchConfig.Name = "wlan0";
  #   networkConfig.DHCP = "yes";
  # };
}
