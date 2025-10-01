{pkgs, ...}: {
  home.packages = with pkgs; [
    fastfetch
    statix
    deadnix

    # Archives
    zip
    xz
    unzip

    # System
    bat
    eza
    psmisc
    stow
    lsof
    lm_sensors
    wget

    # Yazi stuff
    yazi
    ffmpeg
    jq
    fd
    fzf
    ripgrep
    poppler
    imagemagick
    resvg
  ];

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
      silent = true;
    };
    zoxide.enable = true;
  };
}
