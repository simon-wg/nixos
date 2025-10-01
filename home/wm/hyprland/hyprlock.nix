{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.wayland.windowManager.hyprland;
in {
  config = lib.mkIf (cfg.enable) {
    home.file."my-wallpapers" = {
      source = ./wallpapers;
      target = ".local/share/backgrounds";
      recursive = true;
    };

    home.packages = with pkgs; [
      jetbrains-mono
    ];

    fonts.fontconfig.enable = true;

    programs.hyprlock = {
      enable = true;

      settings = {
        background = {
          monitor = "";
          path = "${config.home.homeDirectory}/.local/share/backgrounds/2.jpg";
          blur_passes = 1;
          contrast = 1;
          brightness = 1;
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
          # Gradient
          # outer_color = "rgba(33ccffee) rgba(00ff99ee) 45deg";
          outer_color = "rgba(ffffffcc)";
          inner_color = "rgba(0, 0, 0, 0.2)";
          font_color = "rgba(ffffffcc)";
          #font_color = "$foreground";
          fade_on_empty = false;
          rounding = -1;
          check_color = "rgb(204, 136, 34)";
          placeholder_text = ''<i><span foreground="##ffffffcc">Input Password...</span></i>'';
          hide_input = false;
          position = "-20, 0";
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
            position = "-20, 300";
            halign = "center";
            valign = "center";
          }

          # Time
          {
            monitor = "";
            text = ''cmd[update:1000] echo "$(date +"%-I:%M")"'';
            color = "rgba(242, 243, 244, 0.75)";
            font_size = 95;
            font_family = "JetBrains Mono Extrabold";
            position = "-20, 200";
            halign = "center";
            valign = "center";
          }
        ];
      };
    };
  };
}
