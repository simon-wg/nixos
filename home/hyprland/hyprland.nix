{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    inputs.quickshell.packages.${system}.default
    rofi
    hyprcursor
  ];

  xdg.configFile."hypr/hyprland.conf".source = ./hyprland.conf;
}
