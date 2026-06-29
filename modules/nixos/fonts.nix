{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    nerd-fonts.caskaydia-cove
    nerd-fonts.jetbrains-mono

    noto-fonts
    noto-fonts-color-emoji
  ];
}
