{ pkgs, ... }: {
  home.packages = with pkgs; [
    eza
    yazi
    trash-cli
    # impala
    # bluetui
    # wiremix
    scrcpy
    android-tools
  ];
}
