{
  applications = {
    communication = ./applications/communication.nix;
    core = ./applications/core.nix;
    documents = ./applications/documents.nix;
    multimedia = ./applications/multimedia.nix;
  };
  communication = {
    vesktop = ./communication/vesktop.nix;
  };
  desktop-environment = {
    wayland = {
      core = ./desktop-environment/wayland/core.nix;
      hyprland = ./desktop-environment/wayland/hyprland;
    };
  };
  development = {
    editors = {
      neovim = ./development/editors/neovim;
      vscode = ./development/editors/vscode;
    };
    languages = {
      nix = ./development/languages/nix.nix;
    };
    terminals = {
      ghostty = ./development/terminals/ghostty.nix;
      kitty = ./development/terminals/kitty.nix;
      wezterm = ./development/terminals/wezterm.nix;
    };
    tools = {
      gh = ./development/tools/gh.nix;
      git = ./development/tools/git.nix;
    };
  };
  productivity = {
    file-management = {
      core = ./productivity/file-management/core.nix;
      yazi = ./productivity/file-management/yazi;
    };
  };
  shell = {
    core = ./shell/core.nix;
    fish = ./shell/fish;
    starship = ./shell/starship;
  };
}
