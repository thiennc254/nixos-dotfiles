{ ... }:

{
  boot.tmp = {
    useTmpfs = true;
    tmpfsSize = "2G";
    cleanOnBoot = true;
  };

  services.fstrim = {
    enable = true;
    interval = "weekly";
  };
}
