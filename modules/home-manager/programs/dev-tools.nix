{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Compilers & Runtimes
    clang
    nodejs_24
    python3

    # Build Tools
    cmake
    gnumake
    ninja
    llvmPackages.lld

    # Dev Utils
    mise
  ];
}
