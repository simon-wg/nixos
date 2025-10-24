{
  pkgs,
  lib,
  ...
}:
{
  programs.nvf.settings.vim = {
    telescope = {
      enable = true;
      setupOpts = {
        color_devicons = true;
        path_display = [ "smart" ];
      };
      extensions = [
        {
          name = "fzf";
          packages = [ pkgs.vimPlugins.telescope-fzf-native-nvim ];
          setup.fzf.fuzzy = true;
        }
        {
          name = "ui-select";
          packages = [ pkgs.vimPlugins.telescope-ui-select-nvim ];
          setup.ui-select = lib.mkLuaInline ''function()return require("telescope.themes").get_dropdown({})end'';
        }
      ];
    };
    keymaps = [
      {
        action = "<cmd>Telescope current_buffer_fuzzy_find<CR>";
        key = "<leader><leader>";
        mode = "n";
        silent = true;
        desc = "Telescope";
      }
    ];
  };
}
