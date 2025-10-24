{ pkgs, ... }:
{
  home.packages = with pkgs; [
    zip
    xz
    unzip
  ];
}
