"██╗███╗░░██╗██╗████████╗░░░██╗░░░██╗██╗███╗░░░███╗
"██║████╗░██║██║╚══██╔══╝░░░██║░░░██║██║████╗░████║
"██║██╔██╗██║██║░░░██║░░░░░░╚██╗░██╔╝██║██╔████╔██║
"██║██║╚████║██║░░░██║░░░░░░░╚████╔╝░██║██║╚██╔╝██║
"██║██║░╚███║██║░░░██║░░░██╗░░╚██╔╝░░██║██║░╚═╝░██║ 
"╚═╝╚═╝░░╚══╝╚═╝░░░╚═╝░░░╚═╝░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝
              

"---------------------------------vim config---------------------------- 
syntax on 
set number 
set mouse=a
set clipboard=unnamed
set showcmd
set ruler
set cmdheight=2
set encoding=UTF-8
set showmatch
set sw=2
set relativenumber
let mapleader = " "
set laststatus=2
set backspace=2
set guioptions-=T
set guioptions-=l
" In your init.lua or init.vim
set termguicolors
"Get out of insert mode 
"Salir de modo insertar
imap jk <Esc>
imap <C-c> <Esc>l
"mueve bloques de codigo en modo visual o V-Line
"Moves Blocks of code in visual mode or V-Line xnoremap K :move '<-2<CR>gv-gv xnoremap J :move '>+1<CR>gv-gv 
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv 
" Better indenting
" Mejor Indentación
vnoremap < <gv
vnoremap > >gv

"-------------------------------Sources-------------------------------
source ~/AppData/Local/nvim/plugins/plugins.vim
source ~/AppData/Local/nvim/plugins/plug-config.vim
"--------------------------------Plugins Config--------------------------------------------
"save file
"guardar archivo
nmap <leader>w :w <CR>
"cerrar ventana
"
"close current  window
nmap <C-w> :q <CR>
nmap <leader>q :q <CR>
nmap <leader>so :so%<CR>
"search commands 
"comandos de busqueda
nmap <leader>fs :FZF<CR>
nmap <leader>rg :Rg<CR>
"configuracion de tabs
let g:indentLine_enabled = 1
let g:indentLine_char = '┆'
let g:indentLine_faster = 1
let g:indentLine_fileTypeExclude=["nerdtree"]

"change colorscheme with telescope
" Space cl open colorschemes selector
nmap <silent> <TAB>cl :Telescope colorscheme<CR>
" space fb open file browser
nmap <Leader>fb :Telescope file_browser<CR>
" space ff find files
nmap <Leader>ff :Telescope find_files<CR>
nmap <Leader>gc :Telescope git_commits<CR>
" Git config 
" Git add all
nmap <Leader>ga :Git add .<CR>
nmap <Leader>sh :Git status --short<CR>
nmap <Leader>gl :Git log<CR>
nnoremap <leader>gd :Gvdiff<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>
"Buscar dos carácteres con easymotion
"Search for two chars with easymotion
nmap <Leader>s <Plug>(easymotion-s2)
" TAB in general mode will move to text buffer
" TAB en modo normal se moverá al siguiente buffer
nnoremap <silent> <TAB> :bnext<CR>
" SHIFT-TAB will go back
" SHIFT-TAB va para atras 
nnoremap <silent> <S-TAB> :bprevious<CR>
nmap <Leader>cs :CocDisable<CR>
"close buffer
"cerrar buffer
nmap <leader>bd :bdelete<CR>
"Rest Client ESPACIO 0 
noremap <Leader>0 :CocCommand rest-client.request <cr>
"Telescope buffers
nmap <leader>tb :Telescope buffers<CR>
nnoremap <leader>nt :NvimTreeToggle<CR>
" command for quicktype passing args
nnoremap <leader>j :!quicktype -l typescript --just-types --top-level Example<CR>
nnoremap <leader>gb :Gitsigns blame_line<CR>
"---------- COLORSCHEMES CONFIG ---------------
set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:nord_disable_background = 1
lua << EOF
vim.g.tokyonight_transparent = 1
vim.g.tokyonight_transparent_sidebar = 1
vim.g.tokyonight_italic_comments = true
vim.g.tokyonight_italic_keywords = true
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_style = "storm"
vim.g.gruvbox_transparent_bg = true
vim.g.gruvbox_italic = true
-- Lua
--vim.cmd("colorscheme tokyonight")
-- Lua
require('github-theme').setup({ transparent = true, dark_sidebar = true, theme_style = "dark_default" })
require 'nvim-treesitter.install'.compilers = { "gcc" }
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
}
-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require'nvim-tree'.setup {
	actions = {
		open_file = {
			quit_on_open = true
		}
	}
}
require("nvim-treesitter.configs").setup {
  highlight = {
      -- ...
  },
  -- ...
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
		--colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
}

local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()
-- icon
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    -- This sets the spacing and the prefix, obviously.
    virtual_text = {
      spacing = 4,
      prefix = '',
			signs = true,
			update_in_insert = true
    }
  }
)
EOF
set completeopt=menuone,noinsert,noselect
let g:neoformat_try_node_exe = 1
hi Normal guibg=NONE ctermbg=NONE
"Close tags automatically
"Cerrar tags automaticamente
let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.jsx, *.js'
