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

## Learning vim

- to write and quit `:wq`
- to just quit `:q` and do so in forcefully `:q!`
- to write a command in terminal `:!<command>`
- to start writing use `i` to start before, `a` to start from after and `o` to start typing in a new line.
- If we use `shift` with them then `I` will start editing in the beginning of the line, `A` for the end of the line and `O` is used to start editing a line above the cursor.
- to set up line number write `:set number` and also relative number `:set relativenumber` for next option.
- now to move certain number of line at one use `<number>` + `up`/`down`.
- `h` for left, `j` for down, `k` for up and `l` for right cursor move
- press `w` for jumping char wise (_case sensitive_) use `W` for ignoring that.
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
- press `%` to jump one parentesis to another

> [!NOTE]
> To save the edited things use write them in `~/.vimrc` <br>
> use `tab` for suggestion <br>
> almost every cmd can be used with number of that times
