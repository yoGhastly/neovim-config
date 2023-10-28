vim.g.tokyonight_transparent = 1
vim.g.tokyonight_transparent_sidebar = 1
vim.g.tokyonight_italic_comments = true
vim.g.tokyonight_italic_keywords = true
vim.g.tokyonight_italic_functions = false

require('tokyonight').setup({
  transparent = true,
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    sidebars = "transparent",
    floats = "transparent",
  },
})

--vim.cmd [[colorscheme tokyonight-night]]
