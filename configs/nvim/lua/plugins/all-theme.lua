return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      transparent_background = true,
      flavour = "auto",
      background = {
        light = "latte",
        dark = "mocha",
      },
      float = {
        transparent = true,
        -- solid = true,
      },
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {},-- Uncomment to turn off hard-coded styles
      },
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
      custom_highlights = function(colors)
        return {
          -- 1. Line Numbers
          LineNr = { fg = "#9ca0b0" },
          LineNrAbove = { fg = "#a6adc8" },
          LineNrBelow = { fg = "#a6adc8" },
          CursorLineNr = { fg = colors.lavender, bold = true },

          -- 2. Noice Cmdline (Khung nhập lệnh)
          NoiceCmdlinePopupBorder = { fg = colors.lavender },
          NoiceCmdlinePopupTitle = { fg = colors.lavender, bold = true },
          NoiceCmdlineIcon = { fg = colors.sky }, -- Màu của icon ">"

          -- 3. Completion Menu (Menu gợi ý code - Pmenu)
          Pmenu = { bg = colors.none },
          PmenuSel = { bg = colors.surface0, fg = colors.lavender, bold = true },
          PmenuSbar = { bg = colors.crust },
          PmenuThumb = { bg = colors.surface2 },

          -- 4. Các chi tiết bên trong CMP (Icons và Text khớp lệnh)
          CmpItemAbbrMatch = { fg = colors.sky, bold = true },
          CmpItemAbbrMatchFuzzy = { fg = colors.sky, bold = true },
          CmpItemKind = { fg = colors.teal },
          CmpItemMenu = { fg = colors.overlay1, italic = true },
        }
      end,
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      -- dim_inactive = true,
      lualine_bold = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      on_colors = function(colors)
        colors.bg_statusline = colors.none
      end,
      on_highlights = function(hl, opts)
        hl.TabLineFill = { bg = opts.transparent }
        hl.LineNrAbove = { fg = "#c0caf5", bold = false }
        hl.LineNrBelow = { fg = "#c0caf5", bold = false }
        -- hl.LineNr = { fg = "white", bold = true }
      end,
    },
  },
}
