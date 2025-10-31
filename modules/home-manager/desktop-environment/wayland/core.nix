{ pkgs, ... }:
{
  home.packages = with pkgs; [
    wl-clipboard
  ];
  gtk = {
    enable = true;
    colorScheme = "dark";
  };
  qt = {
    enable = true;
    style.name = "kvantum";
  };
}
