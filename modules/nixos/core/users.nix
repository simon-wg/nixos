{pkgs, ...}: {
  users = {
    mutableUsers = true;
    defaultUserShell = pkgs.fish;
  };

  programs.fish.enable = true;
}
