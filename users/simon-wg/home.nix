{ inputs, ... }:
{
  imports = [
    ../../home/core.nix
    ../../home/hyprland
    ../../home/shell
    ../../home/waybar
    inputs.nixvim.homeModules.default
  ];

  programs.git = {
    enable = true;
    userName = "Simon Westlin Green";
    userEmail = "simon.green@live.se";
    signing = {
      key = "8B6707841AF02C24";
    };
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      push = {
        autoSetupRemote = true;
      };
      commit = {
        gpgSign = true;
      };
      tag = {
        gpgSign = true;
      };
    };
  };
  programs.nixvim.enable = true;
}
