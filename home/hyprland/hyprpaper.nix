{ config, ... }:
{
  home.file."my-wallpapers" = {
    source = ./wallpapers;
    target = ".local/share/backgrounds";
    recursive = true;
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      preload = [ "${config.home.homeDirectory}/.local/share/backgrounds/magritte-apple-man.jpg" ];
      wallpaper = [
        "eDP-1,${config.home.homeDirectory}/.local/share/backgrounds/magritte-apple-man.jpg"
      ];
    };
  };

  home.file.".local/bin/cycle-wallpaper" = {
    text = ''
      #!/usr/bin/env bash
      WALLPAPER_DIR="$HOME/.local/share/backgrounds"
      
      # Use the working find command without -type f
      WALLPAPER=$(find "$WALLPAPER_DIR" -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" | shuf -n 1)
      
      if [ -n "$WALLPAPER" ]; then
        hyprctl hyprpaper preload "$WALLPAPER"
        hyprctl hyprpaper wallpaper "eDP-1,$WALLPAPER"
      else
        exit 1
      fi
    '';
    executable = true;
  };

  systemd.user.services.wallpaper-cycle = {
    Unit = {
      Description = "Cycle wallpapers";
    };
    Service = {
      ExecStart = "${config.home.homeDirectory}/.local/bin/cycle-wallpaper";
      Type = "oneshot";
    };
  };

  systemd.user.timers.wallpaper-cycle = {
    Unit = {
      Description = "Cycle wallpapers every 30 minutes";
    };
    Timer = {
      OnCalendar = "*:0/30";
      Persistent = true;
    };
    Install = {
      WantedBy = [ "timers.target" ];
    };
  };
}
