# NixVim Configuration

This repository contains my personal configuration NixVim, a Neovim configuration managed with Nix.

_My custom version of [dc-tec's NixVim Config](https://github.com/dc-tec/nixvim)_

## How to use

You can use this flake as an input:

```nix
{
    inputs = {
        nixvim.url = "github:adamsurge/nixvim"
    };
}
```

You can then install the package either normally or through home-manager.

#### Normal:

```nix
environment.systemPackages = [
    inputs.nixvim.packages.x86_64-linux.default
];
```

#### Home-Manager

```nix
home-manager.users.<user>.home.packages = [
    inputs.nixvim.packages.x86_64-linux.default
];
```

## Plugins

### General Configuration

- `settings.nix`: Contains general settings for Neovim.
- `keymaps.nix`: Defines key mappings.
- `auto_cmds.nix`: Sets up automatic commands.
- `file_types.nix`: Configures file type specific settings.

### AI

- `copilot.nix`: Configures copilot for use (mainly for avante). Use `:Copilot auth` to sign-in
- `avanete.nix`: Adds similar behaviour to Cursor AI IDE.

### Themes

- `default.nix`: Sets the default theme.

### Completion

- `cmp.nix`: Configures the cmp completion framework.
- `cmp-copilot.nix`: _Disabled_ Adds GitHub Copilot support to cmp.
- `lspkind.nix`: Adds icons to lsp completion items.
- `autopairs.nix`: Adds the autopairs plugin.
- `schemastore.nix`: Adds the schemastore plugin for JSON and YAML schemas.

### Snippets

- `luasnip.nix`: Configures the LuaSnip snippet engine.

### Editor Plugins and Configurations

- `neo-tree.nix`: Configures the NeoTree file explorer.
- `oil.nix`: Configures the oil file explorer.
- `treesitter.nix`: Configures the TreeSitter syntax highlighter.
- `undotree.nix`: Configures the UndoTree undo history visualizer.
- `illuminate.nix`: Configures the Illuminate plugin for highlighting other uses of the current word under the cursor.
- `indent-blankline.nix`: Configures the Indent Blankline plugin for displaying indentation levels.
- `todo-comments.nix`: Configures the Todo Comments plugin for highlighting TODO comments.
- `copilot-chat.nix`: _Disabled_ Configures the Copilot Chat plugin for interacting with GitHub Copilot.
- `navic.nix`: Configures the Navic plugin, shows the current code context.
- `flash.nix`: Configures the flash plugin, better navigation in buffers.

### UI Plugins

- `bufferline.nix`: Configures the Bufferline plugin for enhanced buffer/tab display.
- `lualine.nix`: Configures the Lualine status line plugin.
- `startup.nix`: Configures the startup screen.
- `dressing.nix`: Configures dressing, improves the default vim.ui interface.
- `noice.nix`: Configures noice, better messages, cmdline and popupmenu.

### LSP

- `lsp.nix`: Configures the Neovim LSP client.
- `conform.nix`: Configures the Conform plugin for automatic code formatting.
- `fidget.nix`: Configures the Fidget plugin for displaying LSP diagnostics in the status line.
- `trouble.nix`: Configures the trouble plugin for viewing of diagnostics
- `dap.nix`: Configures dap for debugging programs

### Git

- `lazygit.nix`: Configures the LazyGit plugin for Git integration.
- `gitsigns.nix`: Configures the GitSigns plugin for displaying Git diff information.

### Utils

- `telescope.nix`: Configures the Telescope plugin for fuzzy finding and picking.
- `whichkey.nix`: Configures the WhichKey plugin for displaying key mappings.
- `extra_plugins.nix`: Configures additional plugins.
- `mini.nix`: Configures the Mini plugin.
- `obsidian.nix`: _Disabled_ Confiugres the Obsidian plugin, for note-taking purposes.
- `markdown-preview.nix`: Configures the Markdown Preview plugin.
- `toggleterm.nix`: Configures Terminal plugin.
- `lazyloader.nix`: Enables lazy loading with ln-z.

### Langs

- `rust.nix`: _Disabled (broken)_ Configures rust specific information

Please refer to the individual `.nix` files for more detailed configuration information.

### Possible Additions

Possible plugins to look into adding.

- [Harpoon](https://github.com/ThePrimeagen/harpoon/tree/harpoon2) - Specify projects/frequent files to get to them easier
- [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo) - Better folding
- [TreeSJ](https://github.com/Wansmer/treesj) - Better splitting/joining blocks of code like arrays, hashes, statements, objects, dictionaries, etc.
- [Neogen](https://github.com/danymat/neogen?tab=readme-ov-file#supported-languages) - Add annotations/docstrings following standards with easy editing
- [nvim-bqf](https://github.com/kevinhwang91/nvim-bqf) - Better quickfix (don't really use this at the moment but look into it)
- [aerial.nvim](https://github.com/stevearc/aerial.nvim?tab=readme-ov-file#api) - Code outliner
- [Neorg](https://github.com/nvim-neorg/neorg?tab=readme-ov-file) - Note taking

## References

- [NixVim Docs](https://nix-community.github.io/nixvim/NeovimOptions/index.html)

This configuration has taken inspiration from the following contributors.

- [dc-tec](https://github.com/dc-tec/nixvim)
- [Elythh](https://github.com/elythh/nixvim)
- [MikaelFangel](https://github.com/MikaelFangel/nixvim-config)
