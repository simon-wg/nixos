{
  programs.nvf = {
    enable = true;
    enableManpages = true;
    settings = {
      vim = {
        withPython3 = true;
        withNodeJs = true;
        withRuby = true;
        theme = {
          enable = true;
          name = "catppuccin";
          style = "mocha";
        };
        viAlias = false;
        vimAlias = true;

        globals = {
          mapleader = " ";
          maplocalleader = " ";
        };

        options = {
          mouse = "a";
          showmode = false;
          signcolumn = "yes";
          list = true;
          listchars = "tab:» ,trail:·,nbsp:␣";
          inccommand = "split";
          cursorline = true;
          scrolloff = 10;
          confirm = true;
          modeline = true;
          autoindent = false;
        };

        keymaps = [
          {
            key = "<esc>";
            mode = "n";
            action = "<cmd>nohlsearch<CR>";
          }
          {
            key = "<leader>q";
            mode = "n";
            action = "vim.diagnostic.setloclist";
            lua = true;
            desc = "Open diagnostic [Q]uickfix list";
          }
        ];

        lineNumberMode = "relNumber";
        undoFile.enable = true;

        clipboard = {
          enable = true;
          providers.wl-copy.enable = true;
          registers = "unnamedplus";
        };

        binds.whichKey.enable = true;
        dashboard.alpha.enable = true;
        git.enable = true;

        ui = {
          colorizer.enable = true;
          noice.enable = true;
        };

        visuals = {
          indent-blankline = {
            enable = true;
            setupOpts.scope.enabled = true;
          };
          rainbow-delimiters.enable = true;
          nvim-web-devicons.enable = true;
          fidget-nvim = {
            enable = true;
          };
        };

        telescope = {
          enable = true;
          mappings = {
            liveGrep = "<leader><space>";
          };
        };
      };
    };
  };
}
