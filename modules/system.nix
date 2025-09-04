{
  pkgs,
  pkgs-stable,
  lib,
  username,
  inputs,
  ...
}:
{
  users.users.${username} = {
    isNormalUser = true;
    description = lib.mkDefault username;
    extraGroups = [
      "networkmanager"
      "wheel"
      "input"
    ];
    packages = with pkgs; [
      inputs.zen-browser.packages."${system}".default
      kitty
      nerd-fonts.symbols-only
      noto-fonts-color-emoji
      stow
    ];
  };

  environment.systemPackages = with pkgs; [
    gnome-tweaks
    gnomeExtensions.tweaks-in-system-menu
    psmisc
    gnumake
    unzip
    wget
  ];

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  # Set your time zone.
  time.timeZone = "Europe/Stockholm";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "sv_SE.UTF-8";
    LC_IDENTIFICATION = "sv_SE.UTF-8";
    LC_MEASUREMENT = "sv_SE.UTF-8";
    LC_MONETARY = "sv_SE.UTF-8";
    LC_NAME = "sv_SE.UTF-8";
    LC_NUMERIC = "sv_SE.UTF-8";
    LC_PAPER = "sv_SE.UTF-8";
    LC_TELEPHONE = "sv_SE.UTF-8";
    LC_TIME = "sv_SE.UTF-8";
  };

  security.rtkit.enable = true;
  services = {
    xserver = {
      # Enable the X11 windowing system.
      enable = true;
      # Configure keymap in X11
      xkb = {
        layout = "se";
        variant = "us";
      };
    };
    # Enable CUPS to print documents.
    printing.enable = true;
    # Enable sound with pipewire.
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };
    passSecretService.enable = true;
  };

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 7d --keep 3";
    flake = "/home/simon-wg/nixos";
  };

  programs.fish = {
    enable = true;
    package = pkgs-stable.fish;
  };
}
