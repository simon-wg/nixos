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
    wget
  ];

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
      silent = true;
    };
    zoxide.enable = true;
  };
}
