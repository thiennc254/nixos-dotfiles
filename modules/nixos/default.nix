{ lib, ... }:

let
  dir = ./.;
  fileList = lib.filesystem.listFilesRecursive dir;
  filteredFiles = builtins.filter (
    file: file != (dir + "/default.nix") && lib.hasSuffix ".nix" (builtins.toString file)
  ) fileList;
in
{
  imports = filteredFiles;

  boot.kernelModules = [ "i2c-dev" ];

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    optimise = {
      automatic = true;
      dates = [ "weekly" ];
    };
  };

  services.flatpak.enable = true;
  programs.fish.enable = true;
  hardware.i2c.enable = true;

  services.udev.extraRules = ''
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="0c45", ATTRS{idProduct}=="800a", MODE="0666", TAG+="uaccess"
  '';
}
