{ lib, ... }:
{
  imports = [
    ./core.nix
  ];
  config = {
    programs.nvf.enable = lib.mkDefault true;
    programs.neovim.enable = lib.mkDefault true;
  };
}
