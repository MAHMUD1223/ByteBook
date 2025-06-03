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
Plug 'preservim/nerdtree'                              " File Explorer
Plug 'tpope/vim-commentary'                            " gcc / gc commenting
Plug 'vim-airline/vim-airline'                         " Status line
Plug 'lifepillar/pgsql.vim'                            " PostgreSQL syntax
Plug 'ap/vim-css-color'                                " Show CSS color blocks
Plug 'rafi/awesome-vim-colorschemes'                   " Retro/Vintage color schemes
Plug 'neoclide/coc.nvim', {'branch': 'release'}        " Autocompletion engine
Plug 'ryanoasis/vim-devicons'                          " Filetype icons
Plug 'tc50cal/vim-terminal'                            " Terminal integration
Plug 'preservim/tagbar'                                " Code symbol outline
Plug 'terryma/vim-multiple-cursors'                    " CTRL + N multicursor
Plug 'github/copilot.vim'                              " GitHub Copilot

" --- UI Enhancements ---
Plug 'nvim-tree/nvim-web-devicons'                     " Required for icons
Plug 'akinsho/bufferline.nvim', {'tag': '*'}           " VSCode-style tabs

" --- Start Screen ---
Plug 'goolord/alpha-nvim'						       " Start screen view
Plug 'nvim-lua/plenary.nvim'						   " Required for alpha-nvim
Plug 'nvim-telescope/telescope.nvim'				   " Fuzzy finder
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}            " fzf-lua fuzzy finder

call plug#end()


" ----------------------------------
"      Keybindings & Behavior
" ----------------------------------

" NERDTree Mappings
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFocus<CR>

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
nnoremap <C-p> :lua require'fzf-lua'.files()<CR>         " Fuzzy find files
nnoremap <leader>b :lua require'fzf-lua'.buffers()<CR>   " List open buffers
nnoremap <leader>g :lua require'fzf-lua'.live_grep()<CR> " Live Grep
nnoremap <leader>r :lua require'fzf-lua'.oldfiles()<CR>  " Recently opened files
nnoremap <leader>w :lua require'fzf-lua'.grep_cword()<CR>" Grep word under cursor

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
      { filetype = "nerdtree", text = "File Explorer", padding = 1 },
    },
  }
}
EOF

" NERDTree icons
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

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
colorscheme jellybeans


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
" :PlugInstall
" :PlugClean
" :UpdateRemotePlugins

" CoC Extensions:
" :CocInstall coc-html coc-css coc-json coc-python coc-tsserver

" Snippets:
" :CocCommand snippets.edit

" Alpha start screen is now active!
