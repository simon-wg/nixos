{
  imports = [
    ../../home/hyprland
    ../../home/shell
    ../../home/waybar
    ../../home/nvim
  ];

  home = {
    username = "simon-wg";
    homeDirectory = "/home/simon-wg";
    stateVersion = "25.05";
  };

  programs.home-manager.enable = true;

  programs.zen-browser.enable = true;

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
  programs.neovim.enable = true;
}
