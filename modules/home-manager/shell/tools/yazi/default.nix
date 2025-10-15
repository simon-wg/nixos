{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.programs.yazi;
in {
  config = lib.mkIf cfg.enable {
    programs.yazi = {
      plugins = with pkgs; {
        git = yaziPlugins.git;
        starship = yaziPlugins.starship;
      };
      initLua = ./init.lua;
      settings = {
        plugin.prepend_fetchers = [
          {
            id = "git";
            name = "*";
            run = "git";
          }
          {
            id = "git";
            name = "*/";
            run = "git";
          }
        ];
      };
      keymap.mgr.prepend_keymap = [
        {
          on = ["g" "n"];
          run = "cd ~/nixos";
          desc = "Go ~/nixos";
        }
      ];
    };
  };
}
