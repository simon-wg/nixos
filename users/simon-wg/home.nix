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

  programs.home-manager.enable = true;

  # Personal programs
  programs.zen-browser.enable = true;
  programs.ghostty.enable = true;
  programs.nvf.enable = true;
  programs.neovim.enable = true;

  # Enabled window managers/desktop environments
  wayland.windowManager.hyprland.enable = true;

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
}
