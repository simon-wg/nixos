{pkgs, ...}: {
  imports = [
    ../../modules/home-manager/communication
    ../../modules/home-manager/shell
    ../../modules/home-manager/terminal
    ../../modules/home-manager/utils
    ../../modules/home-manager/programming

    ../../modules/home-manager/wm/hyprland
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
    ghostty.enable = true;
    nvf.enable = true;
    neovim.enable = true;

    git = {
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
      package = pkgs.monaspace-nerdfonts;
    };
    targets.font-packages.enable = true;
    targets.fontconfig.enable = true;
    targets.zen-browser = {
      enable = true;
      profileNames = ["default"];
    };
    targets.hyprpaper.enable = true;
    targets.hyprlock.enable = true;
  };
}
