{
  core = {
    locale = ./core/locale.nix;
    nix = ./core/nix.nix;
    security = ./core/security.nix;
    users = ./core/users.nix;
  };
  sessions = {
    display-manager = ./sessions/display-manager.nix;
    hyprland = ./sessions/hyprland.nix;
    xserver = ./sessions/xserver.nix;
  };
  games = {
    steam = ./games/steam.nix;
  };
  hardware = {
    audio = ./hardware/audio.nix;
    backlight = ./hardware/backlight.nix;
    bluetooth = ./hardware/bluetooth.nix;
    firmware = ./hardware/firmware.nix;
    power = ./hardware/power.nix;
    printing = ./hardware/printing.nix;
    touchpad = ./hardware/touchpad.nix;
    virtualisation = ./hardware/virtualisation.nix;
    zswap = ./hardware/zswap.nix;
  };
  networking = {
    core = ./networking/core.nix;
    vpn = ./networking/vpn.nix;
  };
}
