{pkgs, ...}: {
  fonts.packages = with pkgs; [
    jetbrains-mono
    monaspace
    fira-code
    fira
  ];
  console.font = "Monaspace Neon";
}
