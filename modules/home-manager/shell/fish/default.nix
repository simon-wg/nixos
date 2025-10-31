{ pkgs, ... }:
{
  home.packages = with pkgs; [
    eza
    fzf
    grc
  ];
  programs.fish = {
    enable = true;
    shellInit = ''
      set fish_greeting
    '';
    # interactiveShellInit = ''
    #   set -g fish_color_autosuggestion white --dim
    # '';
    shellAbbrs = {
      ls = "eza";
      l = "eza --icons -l";
      ll = "eza --icons -l";
      la = "eza --icons -la";
      lh = "eza --icons -lh";
      tree = "eza -T";
    };
    plugins = [
      {
        name = "done";
        inherit (pkgs.fishPlugins.done) src;
      }
      {
        name = "forgit";
        inherit (pkgs.fishPlugins.forgit) src;
      }
      {
        name = "fzf-fish";
        inherit (pkgs.fishPlugins.fzf-fish) src;
      }
      {
        name = "grc";
        inherit (pkgs.fishPlugins.grc) src;
      }
    ];
  };
  home.shell.enableFishIntegration = true;
}
