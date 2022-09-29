require 'nvim-treesitter.install'.compilers = { "gcc" }

local rainbow = { "#fafafa","#9F51B6","#F7C244","#F07850","#9CDD29","#0098FA" }

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
	rainbow = { colors = rainbow, termcolors = rainbow }, 
}


for i, c in ipairs(rainbow) do -- p00f/rainbow#81
	vim.cmd(("hi rainbowcol%d guifg=%s"):format(i, c))
end
