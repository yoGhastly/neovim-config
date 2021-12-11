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
Plug 'CantoroMC/ayu-nvim'
Plug 'monsonjeremy/onedark.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
"IDE
Plug 'easymotion/vim-easymotion'
"Navigate with C-h C-l C-j C-k
"Navegar con C-h C-l C-j C-k
Plug 'christoomey/vim-tmux-navigator'
" Copilot
Plug 'github/copilot.vim'
"Airline
Plug 'kyazdani42/nvim-web-devicons'
Plug 'famiu/feline.nvim'
"NERDTREE
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
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
Plug 'mhinz/vim-signify'
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
local vi_mode_utils = require 'feline.providers.vi_mode'
local cursor = require 'feline.providers.cursor'
local lsp = require 'feline.providers.lsp'


local vi_mode_colors = {
  NORMAL = "#4C566A",
  INSERT = "#4C566A",
  VISUAL = "#8FBCBB",
  OP = "#A3BE8C",
  BLOCK = "#8FBCBB",
  REPLACE = "#B48EAD",
  ['V-REPLACE'] = "#B48EAD",
  ENTER = "#8FBCBB",
  MORE = "#8FBCBB",
  SELECT = "#D08770",
  COMMAND = "#A3BE8C",
  SHELL = "#A3BE8C",
  TERM = "#4C566A",
  NONE = "#e0af68",
}


local vi_mode_text = {
    n = "NORMAL",
    no = "OP-PENDING",

    i = "INSERT",
    ic = "INSCOMP",

    v = "VISUAL",
    [''] = "V-BLOCK",
    V = "V-LINE",

    c = "COMMAND",
    cv = "EX",
    ce = "NORMEX",

    s = "SELECT",
    S = "SELECT",

    R = "REPLACE",
    Rv = "VIRTUAL",
    r = "HIT-ENTER",
    rm = "CONFIRM",

    t = "TERM"
}

local function file_osinfo()
    local os = vim.bo.fileformat:upper()
    local icon
    if os == 'UNIX' then
        icon = ' '
    elseif os == 'MAC' then
        icon = ' '
    else
        icon = ' '
    end
    return icon .. os
end

local lsp_get_diag = function(str)
  local count = vim.lsp.diagnostic.get_count(0, str)
  return (count > 0) and ' '..count..' ' or ''
end

-- LuaFormatter off

local comps = {
    vi_mode = {
        icon = {
            provider = function() return ' ⋓ ' end,
            hl = {
                bg = "#4C566A",
                fg = "#eceff4",
            }
        },
        left = {
            provider = function()
              return vi_mode_text[vim.fn.mode()]..' '
            end,
            hl = function()
                local val = {
                    name = vi_mode_utils.get_mode_highlight_name(),
                    bg = vi_mode_utils.get_mode_color(),
                    -- fg = colors.bg
                }
                return val
            end,
            left_sep = {
                str = ' ',
                hl = function()
                    local val = {
                        name = vi_mode_utils.get_mode_highlight_name(),
                        bg = vi_mode_utils.get_mode_color(),
                        fg = "#eceff4" 
                    }
                      return val
                  end,
            },
            right_sep = {
                str = ' ',
                hl = function()
                    local val = {
                        fg = vi_mode_utils.get_mode_color(),
                        bg = "#eceff4" 
                    }
                      return val
                  end,
            }
        },
    },
    file = {
        div = {
            provider = function() return '' end,
            h1 = {
               bg = "#eceff4",
            },
        },
        info = {
            provider = {
              name = 'file_info',
              opts = {
                type = 'short',
                file_readonly_icon = '',
                file_modified_icon = '',
                icons = false,

              }
            },
            right_sep = {
                str = ''
            },
            hl = {
                fg = "#4C566A",
                bg = "#eceff4",
                style = 'italic'
            }
        },
        type = {
            provider = 'file_type',
            left_sep = '',
            right_sep = '█',
            hl = {
                fg = "#eceff4",
                bg = "#e0af68"
            }
        },
        os = {
            provider = file_osinfo,
            left_sep = ' ',
            hl = {
                fg = "#8FBCBB",
                style = 'bold'
            }
        },
    },

    line_percentage = {
        provider = {
            name = 'line_percentage',
        },
        right_sep = {
            str = ' ',
            hl = {
                bg = "#4C566A",
                fg = "#eceff4"
            },
        },
        left_sep = {
            str = ' ',
            hl = {
                bg = "#4C566A",
                fg = "#eceff4"
            },
        },
        hl = {
            style = 'bold',
            bg = "#4C566A",
            fg = "#eceff4",

        }
    },
    git = {
        branch = {
            provider = 'git_branch',
            left_sep = {
                str = '',
                hl = {
                    bg = "#4C566A",
                    fg = "#eceff4"
                },
            },
            right_sep = {
                str = ' ',
               hl = {
                    bg = "#4C566A",
                    fg = "#eceff4"
                },
            },
            icon = {
                str = 'ᛃ ' .. '█',
                hl = {
                    bg = "#4C566A",
                    fg = "#eceff4",
                }
            },
            hl = {
                fg = "#eceff4",
                bg = "#4C566A",
            },
        },
        add = {
            provider = 'git_diff_added',
            icon = {
                str = ' +',
            },
            hl = {
                fg = "#eceff4"
            }
        },
        change = {
            provider = 'git_diff_changed',
            icon = {
                str = ' ⎊',
            },
            hl = {
                fg = "#e0af68"
            }
        },
        remove = {
            provider = 'git_diff_removed',
            icon = {
                str = ' -',
            },
            hl = {
                fg = "#BF616A"
            }
        },
    }
}

local components = {
  active = {},
  inactive = {},
}

table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.inactive, {})
table.insert(components.inactive, {})
table.insert(components.inactive, {})

table.insert(components.active[1], comps.vi_mode.icon)
table.insert(components.active[1], comps.vi_mode.left)
table.insert(components.active[1], comps.file.info)
table.insert(components.active[1], comps.file.os)
table.insert(components.active[1], comps.file.div)
table.insert(components.active[1], comps.git.add)
table.insert(components.active[1], comps.git.change)
table.insert(components.active[1], comps.git.remove)



table.insert(components.inactive[1], comps.vi_mode.left)
table.insert(components.inactive[1], comps.file.info)

--table.insert(components.active[3], comps.diagnos.err)
--table.insert(components.active[3], comps.diagnos.warn)
--table.insert(components.active[3], comps.diagnos.info)
--

table.insert(components.active[3], comps.file.type)
table.insert(components.active[3], comps.git.right_end)
table.insert(components.active[3], comps.git.branch)
table.insert(components.active[3], comps.file.right_end)
table.insert(components.active[3], comps.line_percentage)
table.insert(components.active[3], comps.vi_mode.right)


-- TreeSitter
-- local ts_utils = require("nvim-treesitter.ts_utils")
-- local ts_parsers = require("nvim-treesitter.parsers")
-- local ts_queries = require("nvim-treesitter.query")
--[[ table.insert(components.active[2], {
  provider = function()
    local node = require("nvim-treesitter.ts_utils").get_node_at_cursor()
    return ("%d:%s [%d, %d] - [%d, %d]")
      :format(node:symbol(), node:type(), node:range())
  end,
  enabled = function()
    local ok, ts_parsers = pcall(require, "nvim-treesitter.parsers")
    return ok and ts_parsers.has_parser()
  end
}) ]]


require('feline').setup({
  components = components,
  vi_mode_colors = vi_mode_colors,
  force_inactive = {
    buftypes = {'terminal'},
    bufnames = {}

  },

  colors = {
    bg = '#4C566A',
    fg = '#eceff4',
    black = '#4C566A',
    skyblue = '#4C566A',
    cyan = '#8FBCBB',
    green = '#A3BE8C',
    oceanblue = '#4C566A',
    yellow = '#e0af68',
    orange = '#D08770',
    red = '#BF616A',
    violet = '#B48EAD',
    }
})
EOF
