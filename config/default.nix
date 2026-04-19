{
  imports = [
    # AI
    ./plugins/ai/copilot.nix
    ./plugins/ai/opencode.nix

    # General Configuration
    ./auto_cmds.nix
    ./file_types.nix
    ./keymaps.nix
    ./settings.nix

    # Completion (blink.cmp)
    ./plugins/cmp/blink.nix
    ./plugins/cmp/schemastore.nix

    # Editor plugins and configurations
    ./plugins/editor/aerial.nix
    ./plugins/editor/arrow.nix
    ./plugins/editor/flash.nix
    ./plugins/editor/grug-far.nix
    ./plugins/editor/illuminate.nix
    ./plugins/editor/indent-blankline.nix
    ./plugins/editor/marks.nix
    ./plugins/editor/navic.nix
    ./plugins/editor/neo-tree.nix
    ./plugins/editor/oil.nix
    ./plugins/editor/render-markdown.nix
    ./plugins/editor/todo-comments.nix
    ./plugins/editor/treesitter.nix
    ./plugins/editor/treesj.nix
    ./plugins/editor/ufo.nix
    ./plugins/editor/undotree.nix
    ./plugins/editor/zellij-nav.nix

    # Git
    ./plugins/git/diffview.nix
    ./plugins/git/gitsigns.nix

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
    ./plugins/ui/lualine.nix
    ./plugins/ui/noice.nix
    ./plugins/ui/nui.nix

    # Utils
    ./plugins/utils/extra_plugins.nix
    ./plugins/utils/lazyloader.nix
    ./plugins/utils/mini.nix
    ./plugins/utils/snacks/default.nix
    ./plugins/utils/yanky.nix
    ./plugins/utils/web-devicons.nix
    ./plugins/utils/whichkey.nix
  ];
}
