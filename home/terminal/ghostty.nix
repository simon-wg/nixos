{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.programs.ghostty;
in {
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      monaspace
    ];

    fonts.fontconfig.enable = true;

    programs.ghostty.settings = {
      theme = "Catppuccin Mocha";

      font-family = "Monaspace Neon";
      font-size = 16;

      window-inherit-working-directory = true;

      window-padding-y = 0;
      window-padding-balance = true;
      window-padding-color = "extend";
      background-opacity = 0.6;
    };
  };
}
