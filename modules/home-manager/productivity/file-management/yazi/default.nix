{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkMerge [
    # Make yazi enabled by default
    {programs.yazi.enable = lib.mkDefault true;}

    (
      lib.mkIf config.programs.yazi.enable {
        home.packages = with pkgs; [
          ffmpeg
          jq
          fd
          fzf
          ripgrep
          poppler
          imagemagick
          resvg
        ];

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
      }
    )
  ];
}
