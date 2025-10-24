{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    xhost
    ant
    maven
    python313Packages.mininet-python
    nmap
    openvswitch
  ];
  programs = {
    wireshark = {
      enable = true;
      package = pkgs.wireshark;
    };
    mininet.enable = true;
    java = {
      enable = true;
      package = pkgs.jdk8;
    };
  };
}
