{
  lib,
  pkgs,
  self,
  ...
}:
{
  imports = [
    self.homeModules.development.editors.neovim
    self.homeModules.development.languages.nix
    self.homeModules.development.terminals.ghostty

    self.homeModules.productivity.file-management.core
    self.homeModules.productivity.file-management.yazi

    self.homeModules.shell.core
    self.homeModules.shell.fish
    self.homeModules.shell.starship
  ];

  home = {
    username = "simon-wg";
    homeDirectory = "/home/simon-wg";
    stateVersion = "25.05";
    pointerCursor = {
      package = pkgs.hackneyed;
      name = "Hackneyed";
      size = 24;
      x11.enable = true;
      gtk.enable = true;
      hyprcursor.enable = true;
      hyprcursor.size = 24;
    };
  };

  programs = {
    home-manager.enable = true;

    git = {
      enable = true;
      settings = {
        user = {
          name = "Simon Westlin Green";
          email = "simonwestlingreen@proton.me";
        };
        init = {
          defaultBranch = "main";
        };
        push = {
          autoSetupRemote = true;
        };
        commit = {
          gpgSign = lib.mkDefault true;
        };
        tag = {
          gpgSign = lib.mkDefault true;
        };
      };
      signing = {
        key = lib.mkDefault "8B6707841AF02C24";
      };
    };
  };

  # Catppuccin for styling all available
  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "flamingo";
    hyprlock.enable = false;
    vscode.profiles.default.enable = false;
  };

  # Stylix for other
  stylix = {
    enable = true;
    image = ../../assets/wallpapers/1.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    autoEnable = false;
    targets.zen-browser = {
      enable = true;
      profileNames = [ "default" ];
    };
    targets.hyprpaper.enable = true;
    targets.hyprlock.enable = true;
  };
}
