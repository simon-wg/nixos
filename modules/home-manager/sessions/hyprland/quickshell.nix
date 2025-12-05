{ config, ... }:
{
  home.file.".config/quickshell" = {
    source = config.lib.file.mkOutOfStoreSymlink ''/home/simon-wg/nixos/dotfiles/quickshell'';
    recursive = true;
  };
}
