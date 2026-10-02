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

## Workflow cheat sheet

- `:PluginGuide` or `<leader>?`: task-oriented workflow guide. `<leader>sk` searches every active mapping.
- Find/search: `<leader><space>` or `<leader>ff` finds files; `<leader>ft` searches text; `<leader>sr` opens search/replace.
- Browse/edit files: `<leader>e` opens Snacks Explorer; `<leader>fE` explores from current file; `<leader>oo` opens Oil editable directory buffer.
- Undo/references: `<leader>su` opens undo history; `]]` and `[[` jump references.
- Quickfix: Snacks Picker `<C-q>` populates lists; `<leader>co` opens quickfix and `<leader>cl` opens location list with Quicker editing support. `<leader>dT` opens Trouble diagnostics.
- Git: `<leader>gg` opens Lazygit; `<leader>gs` opens Git status picker.
- Tests/debugging: `<leader>Tr`, `<leader>Tf`, and `<leader>Ta` run nearest, file, and workspace tests; `<leader>db` toggles a breakpoint and `<leader>dc` continues debugging.
- Sessions/outline: `<leader>qs`, `<leader>ql`, and `<leader>qd` manage sessions; `<leader>uo` toggles code outline.

## Validation

```sh
nix fmt -- --check .
nix flake check
nix build .#default
```

Manual smoke checks after building: run the built `nvim`, use `:checkhealth snacks` and `:checkhealth quicker`, then test split navigation, explorer, Oil, undo, references, quickfix/location lists, formatting, hover, and signature help. Clipboard, external Godot language servers, terminal UI, and profiler results require host-specific interactive testing.

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
- `marks.nix`: Configures the marks plugin, better interacting with marks.
- `navic.nix`: Configures the Navic plugin, shows the current code context.
- `neogen.nix`: Configures the Neogen plugin for generating docstrings/annotations.
- `oil.nix`: Configures Oil editable directory buffers. Use `<leader>oo` to edit a directory; Snacks Explorer owns tree/sidebar browsing.
- `quicker.nix`: Configures Quicker for editable native quickfix and location-list buffers. Use `<leader>co` and `<leader>cl` to open them; Snacks Picker populates lists and Trouble remains diagnostics-oriented.
- `refactoring.nix`: Configures the refactoring plugin for extract/inline operations.
- `render-markdown.nix`: Configures the Render Markdown plugin for rendering markdown in the editor.
- `todo-comments.nix`: Configures the Todo Comments plugin for highlighting TODO comments.
- `treesitter.nix`: Configures the TreeSitter syntax highlighter.
- `treesj.nix`: Configures the treesj plugin for splitting/joining code blocks.
- `ufo.nix`: Configures the nvim-ufo plugin for better folding with treesitter and indent providers.
- `yanky.nix`: Configures the Yanky plugin for enhanced yank operations and history.
- `zellij-nav.nix`: Retained but disabled Zellij navigation integration. Native Neovim split navigation owns `<C-h/j/k/l>` and `<C-Left/Down/Up/Right>`. To re-enable Zellij, restore `./plugins/editor/zellij-nav.nix` in `config/default.nix` and disable or make these normal-mode native mappings conditional in `config/keymaps.nix` to avoid duplicate mappings.

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
- `snacks/`: Modular Snacks platform. Picker provides explorer (`<leader>e`, `<leader>fe`, `<leader>fE`), search, and undo history (`<leader>su`); words provides reference highlights and `[[`/`]]` navigation; indent/scope provides indentation display; notifier owns visible notifications; profiler remains opt-in. Oil remains separate for editable directory buffers.
- `web-devicons.nix`: Configures web devicons for file type icons.
- `whichkey.nix`: Configures the WhichKey plugin for displaying key mappings.

### Langs

- `godot.nix`: Configures Godot-specific settings (x86_64 only).
- `rust.nix`: Configures rustaceanvim with codelldb DAP adapter, clippy checks, inlay hints, and the crates plugin for Cargo.toml.

Please refer to the individual `.nix` files for more detailed configuration information.

### Possible Additions

Possible plugins to look into adding.

- [Neorg](https://github.com/nvim-neorg/neorg?tab=readme-ov-file) - Note taking

## References

- [NixVim Docs](https://nix-community.github.io/nixvim/NeovimOptions/index.html)

This configuration has taken inspiration from the following contributors.

- [dc-tec](https://github.com/dc-tec/nixvim)
- [Elythh](https://github.com/elythh/nixvim)
- [MikaelFangel](https://github.com/MikaelFangel/nixvim-config)
