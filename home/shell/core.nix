{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fastfetch
    statix
    deadnix

    # Archives
    zip
    xz
    unzip

    # System
    eza
    fd
    fzf
    psmisc
    ripgrep
    stow
    lsof
    lm_sensors
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
