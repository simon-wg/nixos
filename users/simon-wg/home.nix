{
  pkgs,
  self,
  ...
}:
{
  imports = [
    self.homeModules.applications.communication
    self.homeModules.applications.crypto
    self.homeModules.applications.documents
    self.homeModules.applications.multimedia

    self.homeModules.desktop-environment.wayland.core
    self.homeModules.desktop-environment.wayland.hyprland

    self.homeModules.development.editors.neovim
    self.homeModules.development.editors.vscode
    self.homeModules.development.languages.nix
    self.homeModules.development.terminals.ghostty
    self.homeModules.development.tools.gh

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
  };

  programs = {
    home-manager.enable = true;

    # Personal programs
    zen-browser.enable = true;

    git = {
      enable = true;
      settings = {
        user = {
          name = "Simon Westlin Green";
          email = "simon.green@live.se";
        };
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
      signing = {
        key = "8B6707841AF02C24";
      };
    };
  };

  wayland.windowManager.hyprland.enable = true;

  # Catppuccin for styling all available
  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "flamingo";
    hyprlock.enable = false;
  };

  # Stylix for other
  stylix = {
    enable = true;
    image = ../../assets/wallpapers/1.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    autoEnable = false;
    fonts.monospace = {
      name = "Monaspace Neon NF";
      package = pkgs.monaspace.nerdfonts;
    };
    targets.font-packages.enable = true;
    targets.fontconfig.enable = true;
    targets.zen-browser = {
      enable = true;
      profileNames = [ "default" ];
    };
    targets.hyprpaper.enable = true;
    targets.hyprlock.enable = true;
  };
}
