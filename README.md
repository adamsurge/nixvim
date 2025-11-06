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

- `auto_cmds.nix`: Sets up automatic commands.
- `file_types.nix`: Configures file type specific settings.
- `keymaps.nix`: Defines key mappings.
- `settings.nix`: Contains general settings for Neovim.

### AI

- `avanete.nix`: Adds similar behaviour to Cursor AI IDE.
- `copilot.nix`: Configures copilot for use (mainly for avante). Use `:Copilot auth` to sign-in

### Themes

- `default.nix`: Sets the default theme.

### Completion

- `autopairs.nix`: Adds the autopairs plugin.
- `cmp-copilot.nix`: _Disabled_ Adds GitHub Copilot support to cmp.
- `cmp.nix`: Configures the cmp completion framework.
- `lspkind.nix`: Adds icons to lsp completion items.
- `schemastore.nix`: Adds the schemastore plugin for JSON and YAML schemas.

### Snippets

- `luasnip.nix`: Configures the LuaSnip snippet engine.

### Editor Plugins and Configurations

- `arrow.nix`: Configures the arrow plugin, adds file bookmarks.
- `copilot-chat.nix`: _Disabled_ Configures the Copilot Chat plugin for interacting with GitHub Copilot.
- `flash.nix`: Configures the flash plugin, better navigation in buffers.
- `grug-far`: Configures the gurg-far plugin, easier find/replace.
- `illuminate.nix`: Configures the Illuminate plugin for highlighting other uses of the current word under the cursor.
- `indent-blankline.nix`: Configures the Indent Blankline plugin for displaying indentation levels.
- `marks.nix`: Configures the marks plugin, better interacting with marks.
- `navic.nix`: Configures the Navic plugin, shows the current code context.
- `neo-tree.nix`: Configures the NeoTree file explorer.
- `oil.nix`: Configures the oil file explorer.
- `todo-comments.nix`: Configures the Todo Comments plugin for highlighting TODO comments.
- `treesitter.nix`: Configures the TreeSitter syntax highlighter.
- `treesj.nix`: Configures the treesj plugin for splitting/joining code blocks.
- `ufo.nix`: Configures the nvim-ufo plugin for better folding with treesitter and indent providers.
- `undotree.nix`: Configures the UndoTree undo history visualizer.

### UI Plugins

- `bufferline.nix`: Configures the Bufferline plugin for enhanced buffer/tab display.
- `lualine.nix`: Configures the Lualine status line plugin.
- `noice.nix`: Configures noice, better messages, cmdline and popupmenu.
- `startup.nix`: Configures the startup screen.

### LSP

- `conform.nix`: Configures the Conform plugin for automatic code formatting.
- `dap.nix`: Configures dap for debugging programs
- `fidget.nix`: Configures the Fidget plugin for displaying LSP diagnostics in the status line.
- `lsp.nix`: Configures the Neovim LSP client.
- `trouble.nix`: Configures the trouble plugin for viewing of diagnostics

### Git

- `gitsigns.nix`: Configures the GitSigns plugin for displaying Git diff information.
- `lazygit.nix`: Configures the LazyGit plugin for Git integration.

### Utils

- `colorizer.nix`: Configures the colorizer plugin for highlighting colours in the editor.
- `extra_plugins.nix`: Configures additional plugins.
- `lazyloader.nix`: Enables lazy loading with ln-z.
- `markdown-preview.nix`: _Disabled_ Configures the Markdown Preview plugin.
- `mini.nix`: Configures the Mini plugin.
- `neoclip.nix`: Configures the neoclip plugin for clipboard history management.
- `obsidian.nix`: _Disabled_ Confiugres the Obsidian plugin, for note-taking purposes.
- `snacks.nix`: Configures snacks.nvim plugin, a collection of small QoL plugins.
- `telescope.nix`: Configures the Telescope plugin for fuzzy finding and picking.
- `toggleterm.nix`: Configures Terminal plugin.
- `whichkey.nix`: Configures the WhichKey plugin for displaying key mappings.

### Langs

- `godot.nix`: Configures godot specific information
- `rust.nix`: _Disabled (broken)_ Configures rust specific information

Please refer to the individual `.nix` files for more detailed configuration information.

### Possible Additions

Possible plugins to look into adding.

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
