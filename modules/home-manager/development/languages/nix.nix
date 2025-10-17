{pkgs, ...}: {
  home.packages = with pkgs; [
    statix
    deadnix
  ];
}
