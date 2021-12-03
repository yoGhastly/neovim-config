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
" nerdtree
let g:NERDTreeQuitOnOpen = 1
nmap <leader>nt :NERDTree<CR>
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
"close current  window
nmap <C-w> :q <CR>
nmap <leader>q :q <CR>
nmap <leader>so :so%<CR>
"search commands 
"comandos de busqueda
nmap <leader>gs  :CocSearch
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
inoremap <silent> <C-k> <Cmd>Lspsaga signature_help<CR>
nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>
"open cocExplorer 
"Buscar dos carácteres con easymotion
"Search for two chars with easymotion
nmap <Leader>s <Plug>(easymotion-s2)

" TAB in general mode will move to text buffer
" TAB en modo normal se moverá al siguiente buffer
nnoremap <silent> <TAB> :bnext<CR>
" SHIFT-TAB will go back
" SHIFT-TAB va para atras 
nnoremap <silent> <S-TAB> :bprevious<CR>
"close buffer
"cerrar buffer
nmap <leader>bd :bdelete<CR>
"Rest Client ESPACIO 0 
noremap <Leader>0 :CocCommand rest-client.request <cr>
"Telescope buffers
nmap <leader>tb :Telescope buffers<CR>
"---------- COLORSCHEMES CONFIG ---------------
set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:tokyonight_transparent = 1
let g:nord_disable_background = 1
lua << EOF
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_italic_comments = true
vim.cmd[[colorscheme tokyonight]]
--require('onenord').setup({
--disable = {
--	background = true
--	}
--})
--require('palenightfall').setup()
require 'nvim-treesitter.install'.compilers = { "gcc" }
local nvim_lsp = require('lspconfig')
nvim_lsp.tsserver.setup {}
-- icon
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    -- This sets the spacing and the prefix, obviously.
    virtual_text = {
      spacing = 4,
      prefix = ''
    }
  }
)
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  --...
end
-- TypeScript
nvim_lsp.tsserver.setup {
  on_attach = on_attach
} 
local saga = require 'lspsaga'
require("lspsaga").init_lsp_saga {
				error_sign = '❌',
				warn_sign = '⚠️',
				hint_sign = '💡',
				infor_sign = 'ℹ️',
				dianostic_header_icon = ' 🚒 ',
				code_action_icon = '💡',
				code_action_keys = {
					quit = '<esc>',
					exec = '<cr>'
				},
				finder_definition_icon = '📖 ',
				finder_reference_icon = '🔖 ',
				finder_action_keys = {
					open = '<cr>',
					split = 's',
					vsplit = 'v',
					quit = '<esc>',
					scroll_down = '<c-f>',
					scroll_up = '<c-b>'
				},
				code_action_keys = {
					quit = '<esc>',
					exec = '<cr>'
				},
				rename_action_keys = {
					quit = '<esc>',
					exec = '<cr>'
				},
				definition_preview_icon = '📖 '
			}
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

EOF
hi Normal guibg=NONE ctermbg=NONE
"Close tags automatically
"Cerrar tags automaticamente
let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.jsx, *.js'
"-----------------------------------------------------------------

" nerdtree git config
let g:NERDTreeGit_Show_Git_Branch = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'*',
                \ 'Staged'    :'✚ ',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
