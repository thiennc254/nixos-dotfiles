return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      nix = { "nixpkgs-fmt" },
      python = { "black" },
      javascript = { "prettierd" },
      typescript = { "prettierd" },
      sh = { "shfmt" },
      cpp = { "clang-format" },
      go = { "gofumpt" },
      ["_"] = { "trim_whitespace" },
    },
  },
}
