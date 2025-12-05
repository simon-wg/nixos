{ self, ... }:
{
  imports = [
    self.homeModules.applications.communication
    self.homeModules.applications.core
    self.homeModules.applications.documents
    self.homeModules.applications.multimedia

    self.homeModules.productivity.file-management.yazi

    self.homeModules.desktop-environment.wayland.core
    self.homeModules.desktop-environment.wayland.hyprland

    self.homeModules.development.editors.vscode
    self.homeModules.development.tools.gh
  ];
}
