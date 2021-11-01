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
set cmdheight=1
set encoding=UTF-8
set showmatch
set sw=2
set relativenumber
let mapleader = " "
set laststatus=2
set backspace=2
set guioptions-=T
set guioptions-=l
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
source ~/AppData/Local/nvim/themes/onedark.vim
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

" space ic executes import cost in JS/React modules
nmap <Leader>ic :ImportCost<CR>
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



"---------- COLORSCHEMES CONFIG ---------------
set background=dark
let g:gruvbox_contrast_dark = 'soft'
set termguicolors     " enable truecolors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:airline_theme='ayu_mirage'
let g:airline_powerline_fonts = 1
let g:tokyonight_style = 'storm'
let g:tokyonight_transparent = 1
let g:tokyonight_transparent_sidebar = 1
colorscheme tokyonight
hi Normal guibg=NONE ctermbg=NONE
"Close tags automatically
"Cerrar tags automaticamente
let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.jsx, *.js'
"-----------------------------------------------------------------
"------------------- Completions and that things -----------

lua << EOF
require'lspconfig'.pyright.setup{}
EOF

lua << EOF
require'lspconfig'.rust_analyzer.setup{}
EOF
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true
let g:compe.source.luasnip = v:true


