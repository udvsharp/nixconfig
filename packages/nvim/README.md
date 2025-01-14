# udv-nvim
This is my own nvim configuration.
<!--Yeah, I use neovim btw-->

### Structure
```
.
|
+---options    <-- Contains options that should be set after all plugins loaded and configured.
|                  Per-plugin keymaps are also here for readability
+---pkgs       <-- Package manager setup, I use Lazy right now
+---plugins
|   +---config <-- This folder contains configuration for each plugin
|   +---lazy   <-- A folder created per-package manager
+---prelude    <-- Configs included first-thing after config is loaded
| init.lua     <-- This config file is loaded by nvim
| README.md    <-- We're here!
+
```
The motivation for this design is simple - I want my config to be as portable and as readable as possible.
A lot of files are created, but this way config can be used with different package managers with minimal edition.
Main idea was to support NixOS and non-nix systems simultaniously.

### Keymaps
The idea behind keymaps is subgrouping and mneumonics.
- `<leader>pv` should be a logical "subcommand" of the `<leader>p`. `p` is a mneumonic for a group of related commands. It cant stand for "project" for example.
-  

Here's a complete keymap
```
s - selection
ss - Selection Start
si - Selection Increment
sc - Selection SCope
sd - Decrement
```

# TODO
## New plugins
- [x] whichkey 
    - [x] Theme and opts
    - [ ] Add key groups
- [x] neotree
    - [ ] Switch root dir
    - [ ] "Scope to folder" hotkey with ability to revert (pushd-like)
    - [ ] Detect git repo?
- [x] nvim-window-picker
- [x] toggleterm
    - [ ] Advanced setup, not just a toggle
- [x] cmp
- [ ] overseer
- [ ] shada
    - Or session manager
- [ ] telescope lsp pickers
- [ ] conform
- [ ] alpha-nvim
- [ ] nvim-dap
- [ ] todo-comments
- [ ] lazygit
- [ ] git-signs
    - See if needed with lazygit
- [ ] tmux + nvim-tmux
- [ ] Harpoon
- [ ] Undotree
- [ ] More LSPs
    - Python

## Lookup
- [ ] TJ
    - Completion engine smth
- [ ] clangd switch source-header hotkey
- [ ] lspconfig hotkeys
- [ ] treesitter hotkeys
- [ ] vim.lsp.buf