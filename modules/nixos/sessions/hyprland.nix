{ lib, pkgs, ... }:
{
  fonts.packages = [
    pkgs.monaspace
  ];
  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
    };
    hyprlock.enable = true;
  };
  console.font = lib.mkDefault "Monaspace Neon";
}
