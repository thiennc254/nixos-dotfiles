{
  config,
  pkgs,
  ...
}:

let
  scriptDir = ../../../configs/hypr/scripts;
  scriptNames = builtins.attrNames (builtins.readDir scriptDir);

  mkScript =
    name:
    pkgs.writeShellScriptBin (builtins.replaceStrings [ ".sh" ] [ "" ] name) (
      builtins.readFile (scriptDir + "/${name}")
    );

  hyprlandPackages = with pkgs; [
    waybar
    hyprpolkitagent
    qt5.qtwayland
    qt6.qtwayland
    grim
    slurp
    satty
    hyprpicker
    libnotify
    quickshell
  ];
in
{
  home.packages = (map mkScript scriptNames) ++ hyprlandPackages;

  home.file.".config/hypr" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-dotfiles/configs/hypr";
  };
}
