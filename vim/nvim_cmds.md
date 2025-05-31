# 📝 Neovim Keybindings & Plugin Notes

---

## 📁 File Explorer - NERDTree
- `<Ctrl-n>`: Open NERDTree
- `<Ctrl-t>`: Toggle NERDTree
- `<Ctrl-f>`: Focus NERDTree
- `+ / ~`: Expandable/Collapsible arrow icons in tree

---

## 🧠 Auto-completion - CoC.nvim
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

## 🧭 Tagbar - Symbol Browser
- `<F8>`: Toggle Tagbar

---

## 🧩 GitHub Copilot
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
