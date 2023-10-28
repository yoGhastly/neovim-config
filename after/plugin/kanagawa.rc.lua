-- setup must be called before loading
local opts = {
  compile = true,
  undercurl = false,
  commentStyle = { italic = true },
  keywordStyle = { italic = true},
  transparent = true,         -- do not set background color
  colors = {
    theme = {
      all = {
        ui = {
          bg_gutter = "none",
        }
      }
    }
  },

  overrides = function(colors)
    local theme = colors.theme
    return {
      FloatBorder = { bg = "none" },
      FloatTitle  = { bg = "none" },

      NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
      MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim }
    }
  end
}

--require("kanagawa").setup(opts)
--vim.cmd("colorscheme kanagawa-wave")
