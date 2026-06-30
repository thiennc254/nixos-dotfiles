return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      nix = { "alejandra" },
      python = { "black" },
      go = { "gofumpt" },
      javascript = { "prettierd" },
      typescript = { "prettierd" },
      sh = { "shfmt" },
      cpp = { "clang-format" },
      ["_"] = { "trim_whitespace" },
    },
  },
}
