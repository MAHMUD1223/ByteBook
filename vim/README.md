# VIM

Vim, short for _Vi Improved_, is a powerful and highly configurable text editor that has been around for several decades. It is known for its efficiency, extensibility, and versatility. Let's dive into some key aspects of Vim:

1. History: Vim is based on the original Unix text editor called _"Vi,"_ which was developed in the 1970s. Vi was designed to be lightweight and efficient, providing a modal editing experience. Vim was created as an enhanced version of Vi, adding numerous features and improvements while maintaining compatibility with Vi's commands and keybindings.

2. Modal Editing: One of the defining features of Vim is its modal editing system. Vim has different modes, including Normal mode, Insert mode, Visual mode, and Command-line mode. Each mode serves a specific purpose, allowing users to navigate, edit, select, and execute commands efficiently. This modal approach enables users to perform complex editing tasks with minimal keystrokes.

3. Customization: Vim is highly customizable, allowing users to tailor the editor to their specific needs and preferences. It supports a rich set of configuration options, key mappings, and plugins. Users can customize the appearance, behavior, and functionality of Vim to create a personalized editing environment.

4. Extensibility: Vim supports a vast ecosystem of plugins and extensions that enhance its capabilities. These plugins can provide additional features, syntax highlighting for various programming languages, code completion, version control integration, and much more. The Vim community actively develops and maintains a wide range of plugins, making it possible to extend Vim's functionality to suit different programming workflows.

5. Cross-Platform: Vim is available on multiple platforms, including Linux, macOS, and Windows. This cross-platform support makes it a popular choice for developers working on different operating systems.

6. Future: Vim continues to be actively maintained and improved by its dedicated community. New features and enhancements are regularly added to make Vim even more powerful and user-friendly. Additionally, Vim's influence can be seen in other modern editors, as many have adopted Vim-like keybindings or implemented Vim emulation modes.

Overall, Vim is a versatile and efficient text editor with a rich history and a bright future. Its modal editing system, customization options, and extensibility make it a popular choice among developers who value speed, productivity, and flexibility in their coding workflow.

<br>
 Okay, so lets get started.
 <br>
 ## Some pre setup
 Before runing `:PlugInstall` install the vim-plug first with these command
 ```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
 ```
Also you need to install nerdfornt for symbols with these command in termux
```bash
mkdir -p ~/.termux
cd ~/.termux
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip JetBrainsMono.zip
mv "JetBrainsMonoNerdFontMono-Regular.ttf" font.ttf
rm JetBrainsMono.zip
termux-reload-settings
```
Then test it with in nvim
```bash
:echo "\ue0b0 \uf121 \uf002 \uf015"
```
## Learning vim

- to write and quit `:wq`
- to just quit `:q` and do so in forcefully `:q!`
- to write a command in terminal `:!<command>`
- to start writing use `i` to start before, `a` to start from after and `o` to start typing in a new line.
- If we use `shift` with them then `I` will start editing in the beginning of the line, `A` for the end of the line and `O` is used to start editing a line above the cursor.
- to set up line number write `:set number` and also relative number `:set relativenumber` for next option.
- now to move certain number of line at one use `<number>` + `up`/`down`.
- `h` for left, `j` for down, `k` for up and `l` for right cursor move
- press `w` for jumping char wise (_case sensitive_) use `W` for ignoring that and alse use `e` to select the word and left tge coursor at the word.
- press `b` for jumping back char wise (_case sensitive_) use `B` to ignore that
- to use mouse `:set mouse=a`.
- to control tabstop `:set tabstop=4`.
- to change color scheme `:colorscheme <scheme name>`
- undo with `u`
- redo with `ctrl`+`r`
- to switch into _visual_ mode press `v` (you can select in visual mode and do things with them)
- press `d` for deletation of selected word and `D` for deleting rest of the line after the coursor
- press `dd` for deleting the whole line
- `dw` for deleting the words after part use `diw` to delete whole word
- press `r` for replacing a single char
- press `cc` for deleting and entering insert mode for whole line
- press `ciw` to replace a word
- press `ci"` to change inside a quote
- press `y` for copy selected word
- press `yy` for copy whole line
- press `p` for paste after and `P` for before
- press `0` to go at the end of the line and `$` to go at the end of the line
- press `gg` to go at the beginning of the file and `G` to go at the start of the line and to go on a specific line type `<line_number>G` or `:<line_number>`
- press `%` to jump one parentesis to another
- press `d%` to delete everything in prentesis
- press `t<char>` to go the next char of there and `f<char>` to find it and use capital `T<char>` or `F<char>` to look at before the coursor
- combined with `dt<char>` we can delete till a certain char

> [!NOTE]
> To save the edited things use write them in `~/.vimrc` <br>
> use `tab` for suggestion <br>
> almost every cmd can be used with number of that times

### Advance stuff

- press `>>` or `<<` for indentation to right or left
- press `==` to auto indent
- press `shift` + `v` to go into _line visual mode_ which will select only line
- press `ctrl` + `v` to go into _visual block mode_ which can be used to edit multiple line at a same time
- to search a word use `/<word>` and use `n` for next use `N` to go back also use `?<word>` to reverse the effect
- press `*` for down and `#` find up the next occurence of tge selected word
- to mark a line use `m<letter>` and to go to that line use `'<letter>`
- press `zz` to center the editor
- to replace a word in the entire file `:%s/<word>/<new_word>/g`
- to replace a word in a selected line `:s/<word>/<new_word>/g`
- press `.` to repeat the previous command
- write `:reg` to see the registers in vim
- write `"<reg_num>p` to paste the content on the certain register
- to register a macro use `q<macro_word>` the do the command sequence and press `q` to end the macro. to execute the macro type `@<macro_word>`

## Sample neovim with plugin
- Write below setup into `~/.config/nvim/init.vim`
```lua
:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors

set encoding=UTF-8

call plug#end()

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

nmap <F8> :TagbarToggle<CR>

:set completeopt-=preview " For No Previews

:colorscheme jellybeans

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
```
- Then type `:PlugInstall` that's all
