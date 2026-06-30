{
  lib,
  pkgs,
  ...
}: let
  dir = ./.;
  fileList = lib.filesystem.listFilesRecursive dir;
  filteredFiles =
    builtins.filter (
      file: file != (dir + "/default.nix") && lib.hasSuffix ".nix" (builtins.toString file)
    )
    fileList;
in {
  imports = filteredFiles;

  home.packages = with pkgs; [
    brave

    kdePackages.dolphin
    kdePackages.kdegraphics-thumbnailers
    mpv
    imv
  ];
}
