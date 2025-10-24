{
  config,
  lib,
  ...
}:
let
  cfg = config.programs.wezterm;
in
{
  config = lib.mkIf cfg.enable {
    programs.wezterm.extraConfig = ''
            local wezterm = require 'wezterm'
            local config = wezterm.config_builder()

            -- or, changing the font size and color scheme.
            config.font_size = 16
            config.color_scheme = 'Catppuccin Mocha'

            config.window_background_opacity = 0.6
            config.kde_window_background_blur = true

            -- Tab bar
            config.use_fancy_tab_bar = false
            config.tab_bar_at_bottom = true
            config.hide_tab_bar_if_only_one_tab = true

            config.window_padding = {
              left = 0,
              right = 0,
              top = 0,
              bottom = 0,
            }
      --      wezterm.on('update-status', function(window, pane)
      --        local overrides = window:get_config_overrides() or {}
      --        if string.find(pane:get_title(), '^n?vim?.*') then
      --            overrides.window_padding = {
      --                left = 0,
      --                right = 0,
      --                top = 0,
      --                bottom = 0
      --            }
      --        else
      --            overrides.window_padding = padding
      --        end
      --        window:set_config_overrides(overrides)
      --      end)

            -- Finally, return the configuration to wezterm:
            return config
    '';
  };
}
