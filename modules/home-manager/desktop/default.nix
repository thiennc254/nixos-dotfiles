{
  lib,
  ...
}:

let
  dir = ./.;
  fileList = lib.filesystem.listFilesRecursive dir;
  filteredFiles = builtins.filter (
    file: file != (dir + "/default.nix") && lib.hasSuffix ".nix" (builtins.toString file)
  ) fileList;
in
{
  imports = filteredFiles;
}
