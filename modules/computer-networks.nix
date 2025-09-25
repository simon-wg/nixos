{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    xhost
    ant
    maven
    python313Packages.mininet-python
    nmap
  ];
  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
  };
  programs.mininet.enable = true;
  programs.java = {
    enable = true;
    package = pkgs.jdk8;
  };
}
