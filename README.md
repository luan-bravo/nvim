# luan-bravo's .nvimrc

## External Requirements

## What I Use, for What and Why

## To-dos
### Misc:
- [ ] Actually write some stuff in this readme file (when reinstalling Linux, then probably I'll do it properly)

### Add:
- [ ] A floating **command line** with highlighting and FZF ([Noice.nvim by FOLKE](https://github.com/folke/noice.nvim) perhaps?)
- [ ] add ongoing key combo to show in [lualine]() since [noice]() removed the command line
- [ ] `*_thing` - asterisks completion like ZSH on completions suggestions
    - [ ] (at first char of previously typed WORD) `_thing` -> `this_thing` fix insert mode completion for 
- [ ] extend default dictionary of English on neovim spell checker
    - [ ] [add] grammar checker too

### Fix:
- [ ] Refactor surround key maps
- [ ] Finally fix markdown note taking in nvim to ditch the [Obsidian App]()
    - [ ] Fix [render-md.lua](./lua/theprimeagen/unused/render-md.lua) first
    - [ ] Really badly figure transclusion for any file type with quoting from line slice or maybe even LSP assisted stuff?
- [ ] make man and help open as vsplit if only one buffer showing, else hsplit 
- [ ] make buffers always tab specific (or at least on edit `edit_project` calls)
- [ ] fix encoding difference when copy-pasting from vim to somewhere else (Windows issue?)
- [ ] set `cmp` to always show all possible options for completion on suggestions, not only with `<C-Enter>`

### Study:
- [ ] Changes
- [ ] Solve some rebase conflicts and push and pull some commits as practice
- [ ] Lists
- [ ] Folds
    - Many commands starting with `z`
    - There must be an easier way to get it to work with LSP based folding
- [ ] Spell checker
    - [x] Add to *my dict*
        - [ ] *My dict* file path setting
    - [ ] Ignore once
    - [x] Ignore always
        - Just add as `spellgood` or `spellrare` (`z/` created map map) to add to *dict*
        - Also `zw` adds as `spellwrong`
- [ ] Other modes (e.g. `x`)
    - `x` mode -> virtual without block
- [ ] Fugitive
- [ ] Look further for a `cselect` thing like `cword`
- [ ] Figure what do those `nvim-tree`'s icons (the non file type ones)


## Done
### Misc:
- [x] Better organize config files

### Added:
- [x] [which key](https://github.com/folke/which-key.nvim) by the GOAT **[FOLKE](https://github.com/folke) OH MY BOY FOLKE**
- [x] navigate telescope history key maps

### Studied:
- [x] `cword` and `cWORD`
    - Like `w`  and `W`, but as vars that can be expanded (with `expand()` or `vim.fn.expand()`)
- [x] Nicer gruvier **status line** (again)
