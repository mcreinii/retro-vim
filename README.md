# RetroVim

## Goal

To provide a retro and nostalgic feel yet still modern enough to be functional in this day and age.

## Plugins

### Vim-Plug

### **Dependencies**

- nvim-lua/plenary.nvim
- sindrets/diffview.nvim

### **UI Plugins**

- goolord/alpha-nvim
- sainnhe/everforest
- morhetz/gruvbox
- rebelot/heirline.nvim
- nvim-tree/nvim-tree.lua
- folke/which-key.nvim
- j-hui/fidget.nvim

### **Editor Plugins**

- nvim-treesitter/nvim-treesitter
- windwp/nvim-autopairs
- windwp/nvim-ts-autotag
- saghen/blink.cmp
- rafamadriz/friendly-snippets
- nvim-mini/mini.surround
- nvim-mini/mini.comment
- ibhagwan/fzf-lua
- folke/flash.nvim
- stevearc/conform.nvim
- mluders/comfy-line-numbers.nvim

### **LSP Plugins**

- mason-org/mason-lspconfig.nvim
- mason-org/mason.nvim
- neovim/nvim-lspconfig

### **Git Plugins**

- lewis6991/gitsigns.nvim
- NeogitOrg/neogit

### **Development Plugins**

- folke/lazydev.nvim

## Installation

### Linux / MacOS

```bash
# Backup existing config, data, and state -- Optional
mv ~/.config/nvim{,.bak}
mv ~/.local/share/nvim{,.bak} ~/.local/state/nvim{,.bak}

# Clone and launch
git clone https://github.com/mcreinii/retro-vim ~/.config/nvim && nvim
```

### Windows (Powershell)

```poweshell
# Backup existing config, data, and state -- Optional
Move-Item "$env:LOCALAPPDATA\nvim" "$env:LOCALAPPDATA\nvim.bak" -ErrorAction SilentlyContinue
Move-Item "$env:LOCALAPPDATA\nvim-data" "$env:LOCALAPPDATA\nvim-data.bak" -ErrorAction SilentlyContinue
Move-Item "$env:LOCALAPPDATA\nvim-state" "$env:LOCALAPPDATA\nvim-state.bak" -ErrorAction SilentlyContinue

# Clone and launch
git clone https://github.com/mcreinii/retro-vim "$env:LOCALAPPDATA\nvim"; nvim
```

## Keybindings

### File Explorer

- `<leader>e` Toggle side explorer

### Navigations

- `<leader>s` Flash
- `<leader>S` Flash Treesitter

### Fuzzy Finder

- `<leader>ff` Find files
- `<leader>fG` Find Git files
- `<leader>fg` Live grep
- `<leader>fb` Buffers
- `<leader>fh` Help tags
- `<leader>fr` Recent files
- `<leader>fc` Commands
- `<C-p>` Quick `<leader>ff`

### LSP

- `gd` Go to definition
- `gD` Go to declaration
- `gi` Go to implementation
- `gr` Go to references
- `K` Hover documentation
- `<C-k>` Signature help
- `<leaderla` Code action
- `<leader>lr` Rename symbol
- `<leader>ld` Line diagnostic
- `[d` Previous diagnostic
- `]d` Next diagnostic
- `<leader>lf` Format buffer (Normal, Visual)

### Git

- `<leader>g` Neogit

## Configuration

### Themes

Themes can be easily changed (SAFELY) by doing
```lua
require('utils.themes').setup({
    theme = 'industry' -- Default and fallback.
})
```

---

#### whick-key.nvim

Keybindings will be shown once `<leader>` is pressed

#### Contributions

Want to contibrute? Feel free to do so!
I'd love to see your plugin recommendations and configuration suggestions!

##### Version 1.1.1
