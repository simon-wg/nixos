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
      quickshell
      hyprcursor
      hyprpicker
      nerd-fonts.symbols-only
      monaspace
      pwvucontrol
      wallust
    ];

    fonts.fontconfig.enable = true;

    gtk = {
      enable = true;
      colorScheme = "dark";
    };
    qt = {
      enable = true;
      style.name = "kvantum";
    };

    programs.rofi = {
      enable = true;
      font = lib.mkForce "Monaspace Neon 16";
      theme = let
        inherit (config.lib.formats.rasi) mkLiteral;
      in {
        "window" = {
          anchor = mkLiteral "north";
          location = mkLiteral "north";
          width = mkLiteral "100%";
          padding = mkLiteral "4px";
          children = mkLiteral "[ horibox ]";
        };
        "horibox" = {
          orientation = mkLiteral "horizontal";
          children = mkLiteral "[ entry, listview ]";
        };
        "listview" = {
          layout = mkLiteral "horizontal";
          spacing = mkLiteral "5px";
          lines = mkLiteral "100";
        };
        "entry" = {
          expand = mkLiteral "false";
          width = mkLiteral "10em";
        };
        "element" = {
          padding = mkLiteral "0px 2px";
        };
        "element selected" = {
          background-color = mkLiteral "SteelBlue";
        };

        "element-text, element-icon" = {
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
        };
      };
    };

    wayland.windowManager.hyprland = {
      settings = {
        monitor = [
          ",preferred,auto,1"

          # Thinkpad builtin monitor
          "desc:BOE 0x09DC,1920x1080@60,auto,1"
        ];

        "$terminal" = "uwsm app -- ghostty";
        "$fileManager" = "uwsm app -- dolphin";
        "$menu" = "uwsm app -- rofi -show drun";

        exec-once = [
          "uwsm app -- quickshell"
        ];

        env = [
          "XCURSOR_SIZE,24"
          "HYPRCURSOR_THEME,NotwaitaBlack"
          "HYPRCURSOR_SIZE,24"
        ];

        general = {
          gaps_in = 5;
          gaps_out = 10;
          border_size = 0;
          resize_on_border = false;
          allow_tearing = false;
          layout = "master";
        };

        decoration = {
          rounding = 0;
          rounding_power = 2;

          active_opacity = 1.0;
          inactive_opacity = 0.9;

          blur = {
            enabled = true;
            size = 3;
            passes = 1;
            vibrancy = 0.1696;
          };
        };

        animations = {
          enabled = "yes, please :)";

          bezier = [
            "easeOutQuint,0.23,1,0.32,1"
            "easeInOutCubic,0.65,0.05,0.36,1"
            "linear,0,0,1,1"
            "almostLinear,0.5,0.5,0.75,1.0"
            "quick,0.15,0,0.1,1"
          ];

          animation = [
            "global, 1, 10, default"
            "border, 1, 5.39, easeOutQuint"
            "windows, 1, 4.79, easeOutQuint"
            "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
            "windowsOut, 1, 1.49, linear, popin 87%"
            "fadeIn, 1, 1.73, almostLinear"
            "fadeOut, 1, 1.46, almostLinear"
            "fade, 1, 3.03, quick"
            "layers, 1, 3.81, easeOutQuint"
            "layersIn, 1, 4, easeOutQuint, fade"
            "layersOut, 1, 1.5, linear, fade"
            "fadeLayersIn, 1, 1.79, almostLinear"
            "fadeLayersOut, 1, 1.39, almostLinear"
            "workspaces, 1, 2.44, easeOutQuint, slide"
            "workspacesIn, 1, 1.71, easeOutQuint, slide"
            "workspacesOut, 1, 2.44, easeOutQuint, slide"
          ];
        };

        master = {
          new_status = "slave";
        };

        dwindle = {
          pseudotile = true;
          preserve_split = true;
        };

        misc = {
          force_default_wallpaper = 0;
        };

        input = {
          kb_layout = "se";
          kb_variant = "us";
          # kb_model =
          # kb_options =
          # kb_rules =

          follow_mouse = 1;

          sensitivity = 0;

          touchpad = {
            natural_scroll = true;
          };
        };

        "$mainMod" = "SUPER";
        "$shiftMod" = "$mainMod SHIFT";

        bind =
          [
            "$mainMod, return, exec, $terminal"
            "$mainMod, Q, killactive,"
            "$mainMod, M, exit,"
            "$mainMod, E, exec, $fileManager"
            "$mainMod, V, togglefloating,"
            "alt, space, exec, $menu"
            "alt, Print, exec, uwsm app -- hyprpicker"

            # Dwindle
            "$mainMod, P, pseudo"
            "$mainMod, J, togglesplit"

            # Move focus with mainMod + arrow keys
            "$mainMod, left, movefocus, l"
            "$mainMod, right, movefocus, r"
            "$mainMod, up, movefocus, u"
            "$mainMod, down, movefocus, d"

            # Example special workspace (scratchpad)
            "$mainMod, S, togglespecialworkspace, magic"
            "$mainMod SHIFT, S, movetoworkspace, special:magic"

            # Scroll through existing workspaces with mainMod + scroll
            "$mainMod, mouse_down, workspace, e+1"
            "$mainMod, mouse_up, workspace, e-1"
          ]
          ++ (
            builtins.concatLists (builtins.genList (
                i: let
                  ws = i + 1;
                in [
                  "$mainMod, ${toString ws}, workspace, ${toString ws}"
                  "$shiftMod, ${toString ws}, movetoworkspace, ${toString ws}"
                ]
              )
              9)
          );
        bindm = [
          # Move/resize windows with mainMod + LMB/RMB and dragging
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
        ];

        bindel = [
          # Laptop multimedia keys for volume and LCD brightness
          ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
          ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
          ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
          ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
          ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
        ];

        bindl = [
          # Requires playerctl
          ", XF86AudioNext, exec, playerctl next"
          ", XF86AudioPause, exec, playerctl play-pause"
          ", XF86AudioPlay, exec, playerctl play-pause"
          ", XF86AudioPrev, exec, playerctl previous"
        ];

        windowrule = [
          "suppressevent maximize, class:.*"
          "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
        ];
      };
    };
  };
}
