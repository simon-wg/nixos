{
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 7d --keep 3";
    # TODO Move this to be user configurable
    flake = "/home/simon-wg/nixos";
  };
}
