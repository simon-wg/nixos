{ config, ... }:
{
  services.hypridle.enable = true;
  home.file.".config/hypr/hypridle.conf" = {
    source = config.lib.file.mkOutOfStoreSymlink ''/home/simon-wg/nixos/dotfiles/hypr/hypridle.conf'';
    recursive = true;
  };
}
