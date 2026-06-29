return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    -- Đảm bảo không auto-install parser vì Nix đã lo phần CLI rồi
    auto_install = false,
    -- Nếu bạn muốn cài thêm parser qua Nix, hãy dùng cấu hình này hoặc
    -- cứ để nó dùng trình biên dịch gcc của hệ thống để build parser ngay tại local
    ensure_installed = { "lua", "vim", "vimdoc", "python", "nix", "cpp", "go", "rust" },
  },
  build = false,
}
