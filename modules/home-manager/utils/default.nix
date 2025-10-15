{pkgs, ...}: {
  home.packages = with pkgs; [
    vlc
    geeqie
  ];
  programs.zathura.enable = true;
}
