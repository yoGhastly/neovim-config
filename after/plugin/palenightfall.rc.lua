local colors = require('palenightfall').colors

require('palenightfall').setup({
  color_overrides = {
    yellow = "#F2CD7E"
  },
  highlight_overrides = {
    Constant = { fg = colors.pink },
    Conditional = { fg = '#7FCABE'},
    String = { fg = colors.green },
    NonText = { fg = colors.cyan }
  },
  transparent = true,
})
