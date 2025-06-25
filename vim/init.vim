" ----------------------------------
"       Basic Settings
" ----------------------------------
" Disable swap and backup
set noswapfile
set nobackup
set nowritebackup
set noundofile

" UI/Indentation
set number
set relativenumber
set wrap
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a
set encoding=UTF-8
set termguicolors

" Completion UI tweak
set completeopt-=preview


" ----------------------------------
"        Plugin Manager Start
" ----------------------------------
call plug#begin()

" --- Core Productivity ---
Plug 'tpope/vim-surround'                              " ysw) and surround editing
Plug 'nvim-neo-tree/neo-tree.nvim', {'branch': 'v3.x'} " File Explorer (Neo-tree)
Plug 'MunifTanjim/nui.nvim'							   " Required for Neo-tree
Plug 'tpope/vim-commentary'                            " gcc / gc commenting
Plug 'vim-airline/vim-airline'                         " Status line
Plug 'vim-airline/vim-airline-themes'                  " Airline themes
Plug 'lifepillar/pgsql.vim'                            " PostgreSQL syntax
Plug 'ap/vim-css-color'                                " Show CSS color blocks
Plug 'rafi/awesome-vim-colorschemes'                   " Retro/Vintage color schemes
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }	   "TokyoNight color scheme
Plug 'neoclide/coc.nvim', {'branch': 'release'}        " Autocompletion engine
Plug 'ryanoasis/vim-devicons'                          " Filetype icons
Plug 'tc50cal/vim-terminal'                            " Terminal integration
Plug 'preservim/tagbar'                                " Code symbol outline
Plug 'terryma/vim-multiple-cursors'                    " CTRL + N multicursor
Plug 'github/copilot.vim'                              " GitHub Copilot
Plug 'voldikss/vim-floaterm'							" Floating terminal

" --- UI Enhancements ---
Plug 'nvim-tree/nvim-web-devicons'                     " Required for icons
Plug 'akinsho/bufferline.nvim', {'tag': '*'}           " VSCode-style tabs

" --- Start Screen ---
Plug 'goolord/alpha-nvim'						       " Start screen view
Plug 'nvim-lua/plenary.nvim'						   " Required for alpha-nvim
Plug 'nvim-telescope/telescope.nvim'				   " Fuzzy finder
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Syntax highlighting and more
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}            " fzf-lua fuzzy finder

call plug#end()


" ----------------------------------
"      Keybindings & Behavior
" ----------------------------------

" Prettier keybindings
nnoremap <leader>f :CocCommand prettier.formatFile<CR>

" Neo-tree Mappings
nnoremap <C-n> :Neotree reveal toggle<CR>
nnoremap <C-t> :Neotree toggle<CR>
nnoremap <C-f> :Neotree focus<CR>

" NEOTree Configurations
lua << EOF
require("neo-tree").setup({
  close_if_last_window = true,
  enable_git_status = true,
  enable_diagnostics = true,
  default_component_configs = {
    indent = {
      padding = 1,
    },
    icon = {
      folder_closed = "",
      folder_open = "",
      folder_empty = "",
    },
    name = {
      trailing_slash = false,
      use_git_status_colors = true,
    },
  },
  window = {
    position = "left",
    width = 30,
    mappings = {
      ["<space>"] = "toggle_node",
      ["<cr>"] = "open",
      ["s"] = "open_split",
      ["v"] = "open_vsplit",
      ["q"] = "close_window",
    },
  },
  filesystem = {
    filtered_items = {
      hide_dotfiles = true,
      hide_gitignored = true,
    },
    follow_current_file = { enabled = true },
  },
})
EOF

" FZF-Lua Setup (Lua block)
lua << EOF
require'fzf-lua'.setup {
  winopts = {
    height = 0.85,
    width  = 0.85,
    preview = {
      layout = 'vertical',
      vertical = 'up:60%',
    },
  },
  files = {
    prompt = 'Files❯ ',
    fd_opts = "--color=never --type f --hidden --follow --exclude .git"
  },
  grep = {
    prompt = 'Grep❯ ',
  },
}
EOF

" FZF-Lua Keymaps
nnoremap <C-p> :lua require'fzf-lua'.files()<CR>
nnoremap <leader>b :lua require'fzf-lua'.bufferd()<CR>
nnoremap <leader>g :lua require'fzf-lua'.live_grep()<CR>
nnoremap <leader>r :lua require'fzf-lua'.oldfiles()<CR>
nnoremap <leader>w :lua require'fzf-lua'.grep_cword()<CR>

" FZF-Lua Setup (cleaned prompts)
lua << EOF
require('fzf-lua').setup {
  files = {
    prompt = ''
  },
  buffers = {
    prompt = ''
  },
  grep = {
    prompt = ''
  },
  oldfiles = {
    prompt = ''
  },
  grep_cword = {
    prompt = ''
  }
}
EOF

" Floaterm configuration
let g:floaterm_width = 0.9
let g:floaterm_height = 0.9
let g:floaterm_position = 'center'
let g:floaterm_borderchars = '─│─│╭╮╯╰'
let g:floaterm_wintype = 'float'
" Floaterm keybindings
" Floaterm toggle with F12
nnoremap <F12> :FloatermToggle<CR>
tnoremap <F12> <C-\><C-n>:FloatermToggle<CR>

" Normal mode (silent, no echo messages)
nnoremap <silent> <leader>tn :silent! FloatermNew<CR>
nnoremap <silent> <leader>tl :silent! FloatermNext<CR>
nnoremap <silent> <leader>th :silent! FloatermPrev<CR>
nnoremap <silent> <leader>tc :silent! FloatermKill<CR>
nnoremap <silent> <leader>ts :silent! FloatermSend<CR>
nnoremap <silent> <leader>tS :silent! FloatermSend<CR>

" Terminal mode (also silent)
tnoremap <silent> <leader>tn <C-\><C-n>:silent! FloatermNew<CR>
tnoremap <silent> <leader>tl <C-\><C-n>:silent! FloatermNext<CR>
tnoremap <silent> <leader>th <C-\><C-n>:silent! FloatermPrev<CR>
tnoremap <silent> <leader>tc <C-\><C-n>:silent! FloatermKill<CR>
tnoremap <silent> <leader>ts <C-\><C-n>:silent! FloatermSend<CR>
tnoremap <silent> <leader>tS <C-\><C-n>:silent! FloatermSend<CR>


" CoC Jump to definition
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Bufferline navigation
nnoremap <S-l> :BufferLineCycleNext<CR>
nnoremap <S-h> :BufferLineCyclePrev<CR>

" CoC autocomplete confirmation
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"


" ----------------------------------
"           UI Configs
" ----------------------------------



" Bufferline
lua << EOF
require("bufferline").setup {
  options = {
    mode = "buffers",
    diagnostics = "coc",
    separator_style = "slant",
    show_buffer_close_icons = false,
    show_close_icon = false,
    offsets = {
      {
        filetype = "neo-tree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "center",
        separator = true,
        padding = 1,
      },
    },
  },
}
EOF


" Airline Powerline Fonts
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Colorscheme
" colorscheme jellybeans
syntax enable
set termguicolors " Required for tokyonight
let g:airline_theme = "jellybeans" " Set airline aka status line theme
colorscheme tokyonight-night

" ----------------------------------
"         Alpha Start Screen
" ----------------------------------
lua << EOF
local alpha = require'alpha'
local dashboard = require'alpha.themes.dashboard'

dashboard.section.header.val = {
  [[                                                     ]],
  [[     ███╗   ██╗███████╗██╗   ██╗███╗   ██╗██╗███╗   ███╗]],
  [[     ████╗  ██║██╔════╝██║   ██║████╗  ██║██║████╗ ████║]],
  [[     ██╔██╗ ██║█████╗  ██║   ██║██╔██╗ ██║██║██╔████╔██║]],
  [[     ██║╚██╗██║██╔══╝  ╚██╗ ██╔╝██║╚██╗██║██║██║╚██╔╝██║]],
  [[     ██║ ╚████║███████╗ ╚████╔╝ ██║ ╚████║██║██║ ╚═╝ ██║]],
  [[     ╚═╝  ╚═══╝╚══════╝  ╚═══╝  ╚═╝  ╚═══╝╚═╝╚═╝     ╚═╝]],
  [[                                                     ]],
}

dashboard.section.buttons.val = {
  dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("f", "󰈞  Find file", ":Telescope find_files<CR>"),
  dashboard.button("r", "  Recent", ":Telescope oldfiles<CR>"),
  dashboard.button("q", "  Quit", ":qa<CR>"),
}

dashboard.section.footer.val = { "Neovim ❤️ powered by plugins" }
dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
EOF


" ----------------------------------
"             Notes
" ----------------------------------
" Plugin Installation:
"  Vim-Plug installation:
"  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
"  To install plugins, run the following commands in Neovim:
" :PlugInstall
" :PlugClean
" :UpdateRemotePlugins

" CoC Extensions:
" :CocInstall coc-html coc-css coc-json coc-python coc-tsserver
" For more extensions, checkout the coc_extenstions.txt file here
" There you will see the output of these commands:
" :redir > coc_extensions.txt
" :echo system("jq -r '.dependencies | keys[]' ~/.config/coc/extensions/package.json")
" :redir END

" Snippets:
" :CocCommand snippets.edit

" Alpha start screen is now active!


" ----------------------------------
"     Extra things
" ----------------------------------

" Termux keybindings

" clipboard
" Copy selected text to Android clipboard
vnoremap <leader>y :w !termux-clipboard-set<CR>

" Paste Android clipboard contents into buffer
nnoremap <leader>p :r !termux-clipboard-get<CR>

" colorscheme all preview
function! CycleColorschemes()
  let colors = getcompletion('', 'color')
  for c in colors
    execute 'colorscheme ' . c
    redraw
    echo "Colorscheme: " . c
    sleep 2
  endfor
endfunction

command! CycleThemes call CycleColorschemes()
