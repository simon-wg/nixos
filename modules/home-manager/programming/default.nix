{
  imports = [
    ./vscode
    ./nvim
  ];
  config = {
    programs.gh.enable = true;
    programs.gh-dash.enable = true;
  };
}
