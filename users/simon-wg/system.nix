{
  pkgs,
  lib,
  ...
}:
{
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
  };
}
