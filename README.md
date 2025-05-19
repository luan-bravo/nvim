# luan-bravo's .nvimrc

## External Requirements

## What I Use, for What and Why

## To-dos
### Misc:
- [ ] Actually write some stuff in this readme file (when reinstalling Linux, then probably I'll do it properly)

### Add:
- [!] Add ongoing key combo to show in [lualine]() since [noice]() removed the command line
- [ ] `*_thing` Asterisks completion like ZSH on completions suggestions
    - [ ] At first char of previously typed WORD: `_thing` -> `this_thing` fix insert mode completion for 
- [ ] Extend default dictionary of English on neovim spell checker (future me: wtf did I mean by this? just add the grammar checker)
    - [ ] [Add] grammar checker too

### Fix:
- [!] Refactor surround keymaps
- [!] Fix markdown note taking in nvim to ditch the [Obsidian App]()
    - [ ] Fix [render-md.lua](./lua/theprimeagen/unused/render-md.lua) first
    - [ ] Really badly figure transclusion for any file type with quoting from line slice or maybe even LSP assisted stuff?
- [!] Set `cmp` to always show all possible options for completion on suggestions, not only with `<C-Enter>`
- [!] Make buffers always tab specific (or at least on edit `edit_project` calls)
- [ ] Make man and help open as vsplit if only one buffer showing, else hsplit 
- [ ] Fix encoding difference when copy-pasting from vim to somewhere else (Windows issue?)

### Study:
- [!] Look further for a `cselect` thing like `cword`
- [!] Folds
    - Many commands starting with `z`
    - There must be an easier way to get it to work with LSP based folding
- [x] Spell checker
    - [x] Add to *my Dict*
        - [x] *My Dict* file path setting
            - Not really necessary, the default is good
    - [ ] Ignore once
    - [x] Ignore always
        - Just add as `spellgood` or `spellrare` (`z/` created map map) to add to *dict*
        - Also `zw` adds as `spellwrong`
- [ ] Changes
- [ ] Lists
- [ ] Other modes (e.g. `x`)
    - `x` -> Non-block visual modes
    - `t` -> Terminal mode
    - what other ones don't I know about?
- [ ] Fugitive
    - [ ] Solve some rebase conflicts and push and pull some commits as practice


## Done
### Misc:
- [x] Better organize config files

### Added:
- [x] [which key](https://github.com/folke/which-key.nvim) by the GOAT **[FOLKE](https://github.com/folke) OH MY BOY FOLKE**
- [x] navigate telescope history keymaps
- [x] A floating **command line** with highlighting and FZF ([Noice.nvim by FOLKE](https://github.com/folke/noice.nvim) perhaps?)

### Studied:
- [x] `cword` and `cWORD`
    - Like `w`  and `W`, but as vars that can be expanded (with `expand()` or `vim.fn.expand()`)
- [x] Nicer gruvier **status line** (again)
- [x] Figure what do those `nvim-tree`'s icons (the non file type ones)
    - Those were git status icons. Already configured them with (what I think are) better icons


- [ ] \<S-Enter> to open file on nvim-tree and close tree
