{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    openvpn
    protonvpn-gui
  ];
  # services.openvpn.servers = {
  #   home = {
  #     config = ''config /etc/openvpn/home.conf '';
  #   };
  # };
}
