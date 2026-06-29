{ config, ... }:

{
  imports = [
    ../../modules/home-manager/desktop
    ../../modules/home-manager/programs
  ];

  home = {
    username = "azty";
    homeDirectory = "/home/azty";
    sessionPath = [ "${config.home.homeDirectory}/.local/bin" ];
    stateVersion = "26.05";
  };

  programs.home-manager.enable = true;
}
