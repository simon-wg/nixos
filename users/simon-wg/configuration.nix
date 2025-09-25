{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../../modules/computer-networks.nix
    ../../modules/hyprland.nix
    ../../modules/steam.nix
  ];
  users.users.simon-wg = {
    isNormalUser = true;
    description = lib.mkForce "Simon Westlin Green";
    extraGroups = [
      "docker"
      "input"
      "networkmanager"
      "vboxusers"
      "wheel"
      "wireshark"
    ];
    packages = with pkgs; [
      dnsutils
    ];
    shell = pkgs.fish;
  };

  programs.fish.enable = true;
}
