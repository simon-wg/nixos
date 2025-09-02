{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    inputs.quickshell.packages.${system}.default
    rofi
    hyprcursor
  ];
}
