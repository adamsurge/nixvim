{
  imports = [
    # AI
    ./plugins/ai/avante.nix
    ./plugins/ai/copilot.nix
    ./plugins/ai/mcphub.nix

    # General Configuration
    ./auto_cmds.nix
    ./file_types.nix
    ./keymaps.nix
    ./settings.nix

    # Completion
    ./plugins/cmp/autopairs.nix
    # ./plugins/cmp/cmp-copilot.nix
    ./plugins/cmp/cmp.nix
    ./plugins/cmp/lspkind.nix
    ./plugins/cmp/schemastore.nix

    # Editor plugins and configurations
    # ./plugins/editor/copilot-chat.nix
    ./plugins/editor/flash.nix
    ./plugins/editor/grug-far.nix
    ./plugins/editor/illuminate.nix
    ./plugins/editor/indent-blankline.nix
    ./plugins/editor/navic.nix
    ./plugins/editor/neo-tree.nix
    ./plugins/editor/oil.nix
    ./plugins/editor/render-markdown.nix
    ./plugins/editor/todo-comments.nix
    ./plugins/editor/treesitter.nix
    ./plugins/editor/undotree.nix
    ./plugins/editor/zellij-nav.nix

    # Git
    ./plugins/git/gitsigns.nix
    ./plugins/git/lazygit.nix

    # Languages
    ./plugins/langs/godot.nix
    # ./plugins/langs/rust.nix

    # LSP and formatting
    ./plugins/lsp/conform.nix
    ./plugins/lsp/dap.nix
    ./plugins/lsp/fidget.nix
    ./plugins/lsp/lsp.nix
    ./plugins/lsp/trouble.nix

    # Snippets
    ./plugins/snippets/luasnip.nix

    # Themes
    ./plugins/themes/catppuccin.nix

    # UI plugins
    ./plugins/ui/bufferline.nix
    ./plugins/ui/colorizer.nix
    ./plugins/ui/dressing.nix
    ./plugins/ui/lualine.nix
    ./plugins/ui/noice.nix
    ./plugins/ui/nui.nix
    ./plugins/ui/startup.nix

    # Utils
    ./plugins/utils/extra_plugins.nix
    ./plugins/utils/lazyloader.nix
    # ./plugins/utils/markdown-preview.nix
    ./plugins/utils/mini.nix
    # ./plugins/utils/obsidian.nix
    ./plugins/utils/telescope.nix
    ./plugins/utils/toggleterm.nix
    ./plugins/utils/web-devicons.nix
    ./plugins/utils/whichkey.nix
  ];
}
