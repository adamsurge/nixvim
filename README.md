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

- `copilot.nix`: Configures Copilot suggestions with persistent enable/disable state. Use `:Copilot auth` to sign in.
- `opencode.nix`: Configures the opencode AI assistant.

### Themes

- `catppuccin.nix`: Configures the Catppuccin theme.

### Completion

- `blink.nix`: Configures blink.cmp, the completion framework (LSP, path, buffer, snippets, git, render-markdown sources, plus cmdline completion).
- `schemastore.nix`: Adds the schemastore plugin for JSON and YAML schemas.

### Snippets

- `luasnip.nix`: Configures the LuaSnip snippet engine.

### Editor Plugins and Configurations

- `aerial.nix`: Configures the Aerial plugin for code outline navigation.
- `arrow.nix`: Configures the arrow plugin, adds file bookmarks.
- `flash.nix`: Configures the flash plugin, better navigation in buffers.
- `grug-far.nix`: Configures the grug-far plugin, easier find/replace.
- `illuminate.nix`: Configures the Illuminate plugin for highlighting other uses of the current word under the cursor.
- `indent-blankline.nix`: Configures the Indent Blankline plugin for displaying indentation levels.
- `marks.nix`: Configures the marks plugin, better interacting with marks.
- `navic.nix`: Configures the Navic plugin, shows the current code context.
- `neogen.nix`: Configures the Neogen plugin for generating docstrings/annotations.
- `neo-tree.nix`: Configures the NeoTree file explorer.
- `oil.nix`: Configures the oil file explorer.
- `refactoring.nix`: Configures the refactoring plugin for extract/inline operations.
- `render-markdown.nix`: Configures the Render Markdown plugin for rendering markdown in the editor.
- `todo-comments.nix`: Configures the Todo Comments plugin for highlighting TODO comments.
- `treesitter.nix`: Configures the TreeSitter syntax highlighter.
- `treesj.nix`: Configures the treesj plugin for splitting/joining code blocks.
- `ufo.nix`: Configures the nvim-ufo plugin for better folding with treesitter and indent providers.
- `undotree.nix`: Configures the UndoTree undo history visualizer.
- `yanky.nix`: Configures the Yanky plugin for enhanced yank operations and history.
- `zellij-nav.nix`: Configures Zellij navigation integration.

### UI Plugins

- `bufferline.nix`: Configures the Bufferline plugin for enhanced buffer/tab display.
- `colorizer.nix`: Configures the colorizer plugin for highlighting colours in the editor.
- `lualine.nix`: Configures the Lualine status line plugin.
- `noice.nix`: Configures noice, better messages, cmdline and popupmenu.
- `nui.nix`: Configures the NUI library for UI components.

### LSP, Formatting, Debugging, Testing

- `conform.nix`: Configures the Conform plugin for automatic code formatting.
- `dap.nix`: Configures dap for debugging programs.
- `fidget.nix`: Configures the Fidget plugin for displaying LSP progress in the status line.
- `lsp.nix`: Configures the Neovim LSP client.
- `neotest.nix`: Configures the neotest test runner (rustaceanvim, pytest, go adapters).
- `trouble.nix`: Configures the trouble plugin for viewing diagnostics.

### Git

- `diffview.nix`: Configures the Diffview plugin for enhanced Git diff viewing.
- `gitsigns.nix`: Configures the GitSigns plugin for displaying Git diff information.

### Utils

- `extra_plugins.nix`: Configures additional plugins.
- `lazyloader.nix`: Enables lazy loading with ln-z.
- `mini.nix`: Configures the Mini plugin.
- `persistence.nix`: Configures persistence.nvim for session save/restore.
- `snacks/`: Modular snacks.nvim config (dashboard, picker, terminal, lazygit, rename, input, statuscolumn, bigfile, quickfile, bufdelete, git).
- `web-devicons.nix`: Configures web devicons for file type icons.
- `whichkey.nix`: Configures the WhichKey plugin for displaying key mappings.

### Langs

- `godot.nix`: Configures Godot-specific settings (x86_64 only).
- `rust.nix`: Configures rustaceanvim with codelldb DAP adapter, clippy checks, inlay hints, and the crates plugin for Cargo.toml.

Please refer to the individual `.nix` files for more detailed configuration information.

### Possible Additions

Possible plugins to look into adding.

- [nvim-bqf](https://github.com/kevinhwang91/nvim-bqf) - Better quickfix (don't really use this at the moment but look into it)
- [Neorg](https://github.com/nvim-neorg/neorg?tab=readme-ov-file) - Note taking

## References

- [NixVim Docs](https://nix-community.github.io/nixvim/NeovimOptions/index.html)

This configuration has taken inspiration from the following contributors.

- [dc-tec](https://github.com/dc-tec/nixvim)
- [Elythh](https://github.com/elythh/nixvim)
- [MikaelFangel](https://github.com/MikaelFangel/nixvim-config)
