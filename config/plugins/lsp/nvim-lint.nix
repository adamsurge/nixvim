{
  # Hybrid toolchain: linters come from the active project's PATH (direnv/devShell),
  # not from nixvim. `autoInstall` stays disabled (default) so nothing is bundled.
  plugins.lint = {
    enable = true;
    # Linters missing from PATH (no direnv/devShell active) must be skipped
    # silently; the default nixvim autocmd calls try_lint() without
    # ignore_errors and surfaces `ENOENT` notifications on save.
    autoCmd = {
      callback = {
        __raw = ''
          function()
            require('lint').try_lint(nil, { ignore_errors = true })
          end
        '';
      };
    };
    lintersByFt = {
      python = ["ruff"];
      javascript = ["eslint_d"];
      typescript = ["eslint_d"];
      bash = ["shellcheck"];
      sh = ["shellcheck"];
      zsh = ["shellcheck"];
      go = ["golangcilint"];
      terraform = ["tflint"];
      yaml = ["yamllint"];
      markdown = ["markdownlint"];
      nix = ["statix"];
    };
  };
}
