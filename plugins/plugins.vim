"Plugins
call plug#begin('~/.vim/plugged')
" Temas
" Theme:
Plug 'sheerun/vim-polyglot'
Plug 'mlaursen/vim-react-snippets'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'akinsho/bufferline.nvim'
Plug 'JoosepAlviste/palenightfall.nvim'
Plug 'shaunsingh/nord.nvim'
Plug 'marko-cerovac/material.nvim'
"IDE
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'p00f/nvim-ts-rainbow' 
Plug 'easymotion/vim-easymotion'
"Navigate with C-h C-l C-j C-k
"Navegar con C-h C-l C-j C-k
Plug 'christoomey/vim-tmux-navigator'
" Copilot
Plug 'github/copilot.vim'
"Airline
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'
"NERDTREE
Plug 'preservim/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kyazdani42/nvim-tree.lua'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'SirVer/ultisnips'
" Stable version of coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Close pairs () [] {} ''
"Cerrar los pares () [] {} '' 
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
"FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim',
"colorizer plugin for #fe4918
Plug 'norcalli/nvim-colorizer.lua'
"Multiple cursor like in vscode
Plug 'terryma/vim-multiple-cursors'
"Have the indent lines 
Plug 'yggdroot/indentline'
"Git Integration ______________
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
"Smooth Scrolling
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'psliwka/vim-smoothie'
Plug 'glepnir/lspsaga.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'hrsh7th/vim-vsnip'
Plug 'pangloss/vim-javascript'
Plug 'vim-python/python-syntax'
Plug 'plasticboy/vim-markdown'
"_____________________________
call plug#end()
lua << EOF
require("bufferline").setup{}
require('lualine').setup({
  options = { theme = 'nord' }
})
require('gitsigns').setup {
  signs = {
    add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
    change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    delete = { hl = "GitSignsDelete", text = "▎", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    topdelete = { hl = "GitSignsDelete", text = "▎", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
  },
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter_opts = {
    relative_time = false,
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = "rounded",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1,
  },
  yadm = {
    enable = false,
  },
}
