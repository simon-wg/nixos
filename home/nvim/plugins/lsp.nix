{
  programs.nvf.settings.vim = {
    languages = {
      enableFormat = true;
      enableTreesitter = true;
      nix.enable = true;
      clang.enable = true;
    };

    lsp = {
      enable = true;
      lspconfig.enable = true;
      lspsaga = {
        enable = true;
        setupOpts = {
          ui = {
            code_action = "";
          };
        };
      };
      trouble.enable = true;
    };


    treesitter = {
      enable = true;
      addDefaultGrammars = true;
    };

    diagnostics = {
      nvim-lint.enable = true;
    };

    formatter = {
      conform-nvim.enable = true;
    };

    autocomplete.blink-cmp = {
      enable = true;
      friendly-snippets.enable = true;
      sourcePlugins.emoji.enable = true;
      sourcePlugins.ripgrep.enable = true;
    };
  };
}
