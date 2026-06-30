{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    neovim
    tree-sitter

    #--- LSP ---
    # Lua
    lua-language-server
    stylua

    # HTML, Type Script, Tailwind,...
    vscode-langservers-extracted
    typescript-language-server
    tailwindcss-language-server
    prettierd

    # Nix
    nil
    alejandra
    statix
    deadnix

    # Python
    pyright
    black

    # Bash
    bash-language-server
    shfmt

    # C, C++
    clang-tools

    # Rust
    rust-analyzer

    # Go
    gopls
    gofumpt

    # Markdown
    marksman
    markdownlint-cli2
  ];

  home.file.".config/nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-dotfiles/configs/nvim";
  };
}
