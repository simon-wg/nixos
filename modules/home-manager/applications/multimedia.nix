{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Video
    vlc

    # Images
    geeqie
  ];
}
