let
  paletteSrc = builtins.fetchGit {
    url = "https://github.com/catppuccin/palette";
    ref = "main";
  };

  palette = builtins.fromJSON (builtins.readFile "${paletteSrc}/palette.json");

  # Helper to extract just hex values without the # prefix
  mkColorAttrs = flavor:
    builtins.mapAttrs (
      name: value:
        builtins.substring 1 7 value.hex # Note: changed to 7 to get all 6 hex digits
    )
    flavor.colors; # Access the 'colors' attribute
in {
  # Export all flavors
  mocha = mkColorAttrs palette.mocha;
  latte = mkColorAttrs palette.latte;
  frappe = mkColorAttrs palette.frappe;
  macchiato = mkColorAttrs palette.macchiato;

  # Or export the raw palette if you need more than just hex values
  raw = palette;
}
