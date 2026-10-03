{
  description = "My NeoVim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
    };
  };

  outputs = {
    nixvim,
    flake-parts,
    pre-commit-hooks,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];

      perSystem = {
        system,
        pkgs,
        self',
        ...
      }: let
        nixvimLib = nixvim.lib.${system};
        nixvim' = nixvim.legacyPackages.${system};

        nvim = nixvim'.makeNixvimWithModule {
          inherit pkgs;
          module = ./config;
          extraSpecialArgs = {inherit system;};
        };
      in {
        checks = {
          default = nixvimLib.check.mkTestDerivationFromNvim {
            inherit nvim;
            name = "A nixvim configuration";
          };
          pre-commit-check = pre-commit-hooks.lib.${system}.run {
            src = ./.;
            hooks = {
              alejandra.enable = true;
              statix.enable = true;
              deadnix.enable = true;
            };
          };
        };

        formatter = pkgs.alejandra;

        packages.default = nvim;

        devShells = {
          # Tools this repo itself needs (Nix config + embedded Lua).
          default = pkgs.mkShell {
            packages = with pkgs; [
              alejandra # Nix formatter
              statix # Nix linter
              deadnix # Nix lint (unused bindings)
              stylua # Lua formatter
            ];
            inherit (self'.checks.pre-commit-check) shellHook;
          };

          # Full conform + nvim-lint tool set, mirroring the editor config.
          # Opt-in test harness (`nix develop .#tools`); normal projects should
          # provide these from their own devShell instead.
          tools = pkgs.mkShell {
            packages = with pkgs; [
              # Formatters (conform)
              alejandra
              black
              bicep
              gdtoolkit_4 # gdformat
              go # gofmt
              isort
              jq
              prettier
              prettierd
              rustfmt
              shfmt
              shellharden
              stylua
              # Linters (nvim-lint)
              eslint_d
              golangci-lint
              markdownlint-cli # markdownlint
              ruff
              shellcheck
              statix
              tflint
              yamllint
            ];
          };
        };
      };
    };
}
