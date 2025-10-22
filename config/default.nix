{
  imports = [
    # AI
    ./plugins/ai/copilot.nix
    ./plugins/ai/avante.nix
    ./plugins/ai/mcphub.nix

    # General Configuration
    ./settings.nix
    ./keymaps.nix
    ./auto_cmds.nix
    ./file_types.nix

    # Themes
    ./plugins/themes/catppuccin.nix

    # Completion
    ./plugins/cmp/cmp.nix
    # ./plugins/cmp/cmp-copilot.nix
    ./plugins/cmp/lspkind.nix
    ./plugins/cmp/autopairs.nix
    ./plugins/cmp/schemastore.nix

    # Snippets
    ./plugins/snippets/luasnip.nix

    # Editor plugins and configurations
    ./plugins/editor/neo-tree.nix
    ./plugins/editor/treesitter.nix
    ./plugins/editor/undotree.nix
    ./plugins/editor/illuminate.nix
    ./plugins/editor/indent-blankline.nix
    ./plugins/editor/todo-comments.nix
    # ./plugins/editor/copilot-chat.nix
    ./plugins/editor/navic.nix
    ./plugins/editor/oil.nix
    ./plugins/editor/flash.nix
    ./plugins/editor/render-markdown.nix

    # UI plugins
    ./plugins/ui/bufferline.nix
    ./plugins/ui/lualine.nix
    ./plugins/ui/startup.nix
    ./plugins/ui/dressing.nix
    ./plugins/ui/noice.nix
    ./plugins/ui/nui.nix

    # LSP and formatting
    ./plugins/lsp/lsp.nix
    ./plugins/lsp/conform.nix
    ./plugins/lsp/fidget.nix
    ./plugins/lsp/trouble.nix
    ./plugins/lsp/dap.nix

    # Git
    ./plugins/git/lazygit.nix
    ./plugins/git/gitsigns.nix

    # Utils
    ./plugins/utils/telescope.nix
    ./plugins/utils/whichkey.nix
    ./plugins/utils/extra_plugins.nix
    ./plugins/utils/web-devicons.nix
    ./plugins/utils/mini.nix
    ./plugins/utils/markdown-preview.nix
    # ./plugins/utils/obsidian.nix
    ./plugins/utils/toggleterm.nix
    ./plugins/utils/lazyloader.nix

    # Languages
    # ./plugins/langs/rust.nix
    ./plugins/langs/godot.nix
  ];
}
