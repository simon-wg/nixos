{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.wayland.windowManager.hyprland;
in {
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      jetbrains-mono
    ];

    fonts.fontconfig.enable = true;

    programs.hyprlock = {
      enable = true;

      settings = {
        background = {
          monitor = "";
          blur_passes = 2;
          contrast = 1;
          brightness = 0.8;
        };

        general = {
          no_fade_in = true;
          no_fade_out = true;
          hide_cursor = false;
          grace = 0;
          disable_loading_bar = true;
        };

        input-field = {
          monitor = "";
          size = "250, 60";
          outline_thickness = 2;
          dots_size = 0.2; # Scale of input-field height, 0.2 - 0.8
          dots_spacing = 0.35; # Scale of dots' absolute size, 0.0 - 1.0
          dots_center = true;
          fade_on_empty = false;
          rounding = -1;
          placeholder_text = ''<i><span foreground="##ffffffcc">Input Password...</span></i>'';
          hide_input = false;
          halign = "center";
          valign = "center";
        };

        label = [
          # DATE
          {
            monitor = "";
            text = ''cmd[update:1000] echo "$(date +"%A, %B %d")"'';
            color = "rgba(242, 243, 244, 0.75)";
            font_size = 22;
            font_family = "JetBrains Mono";
            position = "0, 300";
            halign = "center";
            valign = "center";
          }

          # Time
          {
            monitor = "";
            text = ''cmd[update:1000] echo "$(date +"%-H:%M")"'';
            color = "rgba(242, 243, 244, 0.75)";
            font_size = 95;
            font_family = "JetBrains Mono Extrabold";
            position = "0, 200";
            halign = "center";
            valign = "center";
          }
        ];
      };
    };
  };
}
