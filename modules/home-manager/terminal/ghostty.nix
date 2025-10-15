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
      monaspace-nerdfonts
    ];

    fonts.fontconfig.enable = true;

    programs.ghostty.settings = {
      font-family = "Monaspace Neon NF";
      font-size = 16;

      window-inherit-working-directory = false;

      window-padding-y = 0;
      window-padding-balance = true;
      window-padding-color = "extend";
      background-opacity = 1;
    };
  };
}
