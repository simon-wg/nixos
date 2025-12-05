{
  self,
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./hypridle.nix
    ./hyprlock.nix
    ./hyprpaper.nix
  ];
  config = {
    home.packages = with pkgs; [
      quickshell
      hyprpicker
      nerd-fonts.symbols-only
      monaspace.static
      pwvucontrol
      wallust
    ];

    fonts.fontconfig.enable = true;

    programs.rofi = {
      enable = true;
      font = lib.mkForce "Monaspace Neon 16";
      theme =
        let
          inherit (config.lib.formats.rasi) mkLiteral;
        in
        {
          "window" = {
            anchor = mkLiteral "north";
            location = mkLiteral "north";
            width = mkLiteral "100%";
            padding = mkLiteral "4px";
            children = mkLiteral "[ horibox ]";
          };
          "horibox" = {
            orientation = mkLiteral "horizontal";
            children = mkLiteral "[ entry, listview ]";
          };
          "listview" = {
            layout = mkLiteral "horizontal";
            spacing = mkLiteral "5px";
            lines = mkLiteral "100";
          };
          "entry" = {
            expand = mkLiteral "false";
            width = mkLiteral "10em";
          };
          "element" = {
            padding = mkLiteral "0px 2px";
          };
          "element selected" = {
            background-color = mkLiteral "SteelBlue";
          };

          "element-text, element-icon" = {
            background-color = mkLiteral "inherit";
            text-color = mkLiteral "inherit";
          };
        };
    };
    home.file.".config/hypr/hyprland.conf" = {
      source = config.lib.file.mkOutOfStoreSymlink ''/home/simon-wg/nixos/dotfiles/hypr/hyprland.conf'';
      recursive = true;
    };
  };
}
