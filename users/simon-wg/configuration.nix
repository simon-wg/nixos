{ pkgs, lib, inputs, ... }:
{
  imports = [
    ../../modules/hyprland.nix
  ];
  users.users.simon-wg = {
    isNormalUser = true;
    description = lib.mkForce "Simon Westlin Green";
    extraGroups = [
      "networkmanager"
      "wheel"
      "input"
      "docker"
    ];
    packages = with pkgs; [
      inputs.zen-browser.packages."${system}".default
    ];
    shell = pkgs.fish;
  };

  programs.fish.enable = true;
}
