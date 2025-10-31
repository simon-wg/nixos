# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  self,
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix

    ../../users/simon-wg/system.nix

    self.nixosModules.core.locale
    self.nixosModules.core.security
    self.nixosModules.core.users
    self.nixosModules.core.nix

    self.nixosModules.hardware.audio
    self.nixosModules.hardware.backlight
    self.nixosModules.hardware.bluetooth
    self.nixosModules.hardware.firmware
    self.nixosModules.hardware.printing
    self.nixosModules.hardware.touchpad
    self.nixosModules.hardware.zswap

    self.nixosModules.networking.core
    self.nixosModules.networking.vpn

    self.nixosModules.virtualisation.docker

    self.nixosModules.desktop.display-manager
    self.nixosModules.desktop.fonts
    self.nixosModules.desktop.hyprland
    self.nixosModules.desktop.xserver

    self.nixosModules.gaming.steam
  ];

  boot = {
    kernelParams = [ "quiet" ];

    consoleLogLevel = 3;

    # Bootloader.
    loader = {
      grub = {
        enable = true;
        enableCryptodisk = true;
        efiSupport = true;
        device = "nodev";
        useOSProber = true;
      };
      timeout = 10;
      efi.canTouchEfiVariables = true;
    };

    # Use latest kernel.
    kernelPackages = pkgs.linuxPackages_latest;
  };

  fileSystems = {
    "/".options = [ "compress=zstd" ];
    "/home".options = [ "compress=zstd" ];
    "/nix".options = [
      "compress=zstd"
      "noatime"
    ];
  };

  networking.hostName = "apollo"; # Define your hostname.

  # Laptop specific settings
  services = {
    # Enable suspend on lid close.
    logind.settings.Login = {
      HandleLidSwitch = "suspend";
      HandleLidSwitchExternalPower = "suspend";
      HandleLidSwitchDocked = "ignore";
    };
  };
  boot.kernelModules = [
    "rmi_core"
    "rmi_smbus"
    "rmi_ps2"
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
