{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkDefault;
in {
  home.packages = with pkgs; [
    fastfetch
    statix
    deadnix

    # Archives
    zip
    xz
    unzip

    # System
    bat
    eza
    psmisc
    stow
    lsof
    lm_sensors
    wget

    # Yazi stuff
    yazi
    ffmpeg
    jq
    fd
    fzf
    ripgrep
    poppler
    imagemagick
    resvg
  ];

  programs = {
    direnv = {
      enable = mkDefault true;
      nix-direnv.enable = mkDefault true;
      silent = mkDefault true;
    };
    zoxide.enable = mkDefault true;
    yazi.enable = mkDefault true;
  };
}
