{ pkgs, lib, ... }:
{
  imports = [
    ../../modules/hyprland.nix
  ];
  users.users.simon-wg = {
    description = lib.mkForce "Simon Westlin Green";
    shell = pkgs.fish;
  };
}
