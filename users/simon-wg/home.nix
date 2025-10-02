{
  imports = [
    ../../home/shell
    ../../home/terminal
    ../../home/utils

    ../../home/wm/hyprland

    ../../home/programs/nvim
    ../../home/programs/vscode
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

  # Enabled window managers/desktop environments
  wayland.windowManager.hyprland.enable = true;
}
