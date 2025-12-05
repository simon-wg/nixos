{ self, ... }:
{
  imports = [
    self.homeModules.applications.communication
    self.homeModules.applications.core
    self.homeModules.applications.documents
    self.homeModules.applications.multimedia

    self.homeModules.productivity.file-management.yazi

    self.homeModules.development.editors.vscode
    self.homeModules.development.tools.gh

    self.homeModules.sessions.hyprland
    self.homeModules.sessions.wayland
  ];
}
