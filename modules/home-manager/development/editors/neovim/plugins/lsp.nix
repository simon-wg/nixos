{
  self,
  username,
  hostname,
  ...
}:
{
  programs.nvf.settings.vim = {
    languages = {
      enableFormat = true;
      enableTreesitter = true;
      ts.enable = true;
      nix = {
        enable = true;
        lsp.servers = [ "nixd" ];
        format = {
          enable = true;
          type = "nixfmt";
        };
      };
      clang.enable = true;
      python = {
        enable = true;
        lsp.servers = [ "pyright" ];
        format = {
          enable = true;
          type = "ruff";
        };
      };
      lua.enable = true;
      qml.enable = true;
    };

    lsp = {
      enable = true;
      formatOnSave = true;
      lspsaga = {
        enable = true;
        setupOpts = {
          ui = {
            code_action = "";
          };
        };
      };
      servers.nixd.settings.nixd.options = {
        nixos.expr = ''(builtins.getFlake "${self.outPath}").nixosConfigurations.${hostname}.options'';
        home_manager.expr = ''(builtins.getFlake "${self.outPath}").homeConfigurations."${username}@${hostname}".options'';
      };
      trouble.enable = true;
      mappings.format = null;
    };

    treesitter = {
      enable = true;
      addDefaultGrammars = true;
    };

    diagnostics = {
      nvim-lint.enable = true;
    };

    formatter = {
      conform-nvim = {
        enable = true;
      };
    };

    keymaps = [
      {
        key = "<leader>lf";
        mode = "n";
        desc = "Format buffer";
        silent = true;
        lua = true;
        action = ''require("conform").format'';
      }
    ];

    autocomplete.blink-cmp = {
      enable = true;
      friendly-snippets.enable = true;
      sourcePlugins.emoji.enable = true;
      sourcePlugins.ripgrep.enable = true;
    };
  };
}
