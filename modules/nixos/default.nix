{
  core = {
    locale = ./core/locale.nix;
    nix = ./core/nix.nix;
    security = ./core/security.nix;
    users = ./core/users.nix;
  };
  courses = {
    computer-networks = ./courses/computer-networks.nix;
    operating-systems = ./courses/operating-systems.nix;
  };
  desktop = {
    display-manager = ./desktop/display-manager.nix;
    fonts = ./desktop/fonts.nix;
    hyprland = ./desktop/hyprland.nix;
    xserver = ./desktop/xserver.nix;
  };
  gaming = {
    steam = ./gaming/steam.nix;
  };
  hardware = {
    audio = ./hardware/audio.nix;
    backlight = ./hardware/backlight.nix;
    bluetooth = ./hardware/bluetooth.nix;
    firmware = ./hardware/firmware.nix;
    printing = ./hardware/printing.nix;
    touchpad = ./hardware/touchpad.nix;
    zswap = ./hardware/zswap.nix;
  };
  networking = {
    core = ./networking/core.nix;
    vpn = ./networking/vpn.nix;
  };
  virtualisation = {
    docker = ./virtualisation/docker.nix;
  };
}
