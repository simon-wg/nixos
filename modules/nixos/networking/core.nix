{
  networking.networkmanager.enable = true;
  networking.nftables.enable = true;
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      2020
      2021
      2022
      2023
    ];
  };
}
