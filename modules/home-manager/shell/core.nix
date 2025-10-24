{
  lib,
  pkgs,
  ...
}:
let
  inherit (lib) mkDefault;
in
{
  home.packages = with pkgs; [
    fastfetch

    # System
    bat
    eza
    psmisc
    stow
    lsof
    lm_sensors
    wget
  ];

  programs = {
    direnv = {
      enable = mkDefault true;
      nix-direnv.enable = mkDefault true;
      silent = mkDefault true;
    };
    zoxide.enable = mkDefault true;
  };
}
