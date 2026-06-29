{ ... }:

{
  # 1. Zram + lz4
  zramSwap = {
    enable = true;
    memoryPercent = 50;
    algorithm = "lz4";
    priority = 100;
  };

  # 2. Earlyoom: Bảo vệ hệ thống khi hết RAM
  services.earlyoom = {
    enable = true;
    freeMemThreshold = 5;
    # extraArgs = [ "-r" "3600" ];
  };

  # boot.kernelPackages = pkgs.linuxPackages_zen;
}
