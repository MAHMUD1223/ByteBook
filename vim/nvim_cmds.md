# 📝 Neovim Keybindings & Plugin Notes

---

## 📁 File Explorer - NERDTree
- `<Ctrl-n>`: Open NERDTree
- `<Ctrl-t>`: Toggle NERDTree
- `<Ctrl-f>`: Focus NERDTree
- `+ / ~`: Expandable/Collapsible arrow icons in tree

---

## � Auto-completion - CoC.nvim
- `<Tab>` (in insert mode): Accept suggestion if popup visible
- `<Ctrl-l>` (in normal mode): Jump to definition (calls `CocActionAsync('jumpDefinition')`)
- `:CocInstall coc-html coc-css coc-json coc-python coc-tsserver`: Install LSPs
- `:CocCommand snippets.edit`: Edit snippets
- `:CocList extensions`: List CoC extensions
- `:CocList diagnostics`: Show diagnostics list

---

## 📑 VS Code Style Tabs - bufferline.nvim
- `<Shift-l>`: Go to next tab
- `<Shift-h>`: Go to previous tab
- Lua-configured tab labels and diagnostics integration

---

## � Tagbar - Symbol Browser
- `<F8>`: Toggle Tagbar

---

## � GitHub Copilot
- Copilot is enabled globally by plugin
- Custom mappings can be added (not defined yet)

---

## 🔁 vim-surround
- `ys<motion><char>`: Surround something
  - `ysiw"` → adds double quotes around word
- `cs'"` → change single to double quotes
- `ds"` → delete surrounding quotes

---

## 💬 vim-commentary
- `gcc`: Comment/uncomment a line
- `gc{motion}`: Comment a block (e.g. `gc3j`)

---

## ⌨️ vim-multiple-cursors
- `<Ctrl-n>`: Select next word and enter multicursor mode
- `<Ctrl-n>` (again): Add more cursors
- `<Esc>`: Exit multicursor mode

---

## 🎨 vim-css-color
- Inline CSS colors rendered visually (no keybinding needed)

---

## 🎛 Airline
- Status bar shows file info, branch, line number, etc.
- Uses powerline symbols for aesthetics

---

## 💻 Terminal - vim-terminal
- You can open a terminal in a new buffer: `:Term`

---

## 🖍 Colorscheme
- Active: `jellybeans` (from `awesome-vim-colorschemes`)
- Change with: `:colorscheme <name>`

---

## ⚙️ Misc Commands
- `:PlugInstall`: Install all plugins
- `:PlugClean`: Remove unused plugins
- `:UpdateRemotePlugins`: Update plugin integrations


---

# 🔧 Additional Keybindings

# 📘 Neovim Custom Keybindings

## 🔁 Buffer Management

| Mode | Key        | Description |
|------|------------|-------------|
| `n` | `H` | Go to previous buffer in BufferLine |
| `n` | `L` | Go to next buffer in BufferLine |
| `n` | `[b` | Go to previous buffer (:bprevious) |
| `n` | `]b` | Go to next buffer (:bnext) |
| `n` | `[B` | Go to first buffer (:brewind) |
| `n` | `]B` | Go to last buffer (:blast) |
| `n` | `&` | Rerun last :substitute command (:&&) |

## 📂 File & Search (fzf-lua)

| Mode | Key        | Description |
|------|------------|-------------|
| `n` | `\w` | Grep for word under cursor |
| `n` | `\r` | Show recently opened files |
| `n` | `\g` | Live grep |
| `n` | `\b` | Show buffers |

## 🧠 LSP & Code Navigation

| Mode | Key        | Description |
|------|------------|-------------|
| `n` | `gra` | Trigger LSP code action (vim.lsp.buf.code_action()) |
| `n` | `grn` | Rename symbol (vim.lsp.buf.rename()) |
| `n` | `grr` | Show references (vim.lsp.buf.references()) |
| `n` | `gri` | Go to implementation (vim.lsp.buf.implementation()) |
| `n` | `gO` | Show document symbols (vim.lsp.buf.document_symbol()) |

## 🧭 Cursor & Motion

| Mode | Key        | Description |
|------|------------|-------------|
| `n` | `Y` | Yank to end of line (y$) |
| `n` | `[<Space>` | Insert an empty line above the cursor |
| `n` | `]<Space>` | Insert an empty line below the cursor |
| `n` | `[d` | Jump to previous diagnostic in current buffer |
| `n` | `]d` | Jump to next diagnostic in current buffer |
| `n` | `[D` | Jump to first diagnostic |
| `n` | `]D` | Jump to last diagnostic |
| `n` | `%` | Match pair (using Matchit plugin) |

## 🧵 Snippets & Tab

| Mode | Key        | Description |
|------|------------|-------------|
| `s` | `Tab` | Jump to next snippet field or insert Tab |

## 🖥️ Terminal (Floaterm)

| Mode | Key        | Description |
|------|------------|-------------|
| `n` | `\ts` | Send command to terminal (FloatermSend) |
| `n` | `\tc` | Kill Floaterm instance (FloatermKill) |
| `n` | `\th` | Previous Floaterm terminal |
| `n` | `\tl` | Next Floaterm terminal |
| `n` | `\tn` | New Floaterm terminal |

## 🔗 Multi-cursor

| Mode | Key        | Description |
|------|------------|-------------|
| `n` | `g<C-N>` | Start new multi-cursor (normal mode) |
| `x` | `g<C-N>` | Start new multi-cursor (visual mode) |
| `n` | `g<M-n>` | Select all matches with multi-cursors (normal mode) |
| `x` | `g<M-n>` | Select all matches with multi-cursors (visual mode) |

## 🔧 Miscellaneous

| Mode | Key        | Description |
|------|------------|-------------|
| `n` | `F11` | Execute current file using vimterm_term#exec_file() |
| `x` | `@` | Replay macro on selected lines (:normal! @<reg>) |
| `n` | `gx` | Open URI or filepath under cursor |

## 💬 Comments & Surround

| Mode | Key        | Description |
|------|------------|-------------|
| `n` | `cs/ds/yss` | Surround mappings (vim-surround) |
| `n` | `gcc/gc` | Comment mappings (vim-commentary) |

