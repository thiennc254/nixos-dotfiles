{ pkgs, ... }:

{
  boot.kernelParams = [
    "i915.enable_fbc=1"
    "i915.enable_psr=1"
  ];

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-compute-runtime
      libvdpau-va-gl
      libva-vdpau-driver
    ];
  };
}
