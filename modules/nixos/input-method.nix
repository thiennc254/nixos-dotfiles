{ inputs, pkgs, ... }:
{
  imports = [
    inputs.fcitx5-lotus.nixosModules.fcitx5-lotus
  ];

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = [
      pkgs.qt6Packages.fcitx5-configtool
      pkgs.qt6Packages.fcitx5-unikey
      inputs.fcitx5-lotus.packages.${pkgs.stdenv.hostPlatform.system}.fcitx5-lotus
    ];
  };

  services.fcitx5-lotus = {
    enable = true;
    users = [ "azty" ];
  };
}
