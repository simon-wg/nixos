{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    quickshell
    rofi
    hyprcursor
  ];

  xdg.configFile."hypr/hyprland.conf".source = ./hyprland.conf;
}
