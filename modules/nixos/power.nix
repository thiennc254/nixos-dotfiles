{ ... }:

{
  services.tuned.enable = false;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  services.tlp = {
    enable = false;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "powersave";
      CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";
      PLATFORM_PROFILE_ON_AC = "balanced";
    };
  };

  services.thermald.enable = false;
}
