{ pkgs, ... }:
{
  # git config: but you already knew that didn't you?
  programs.git = {
        enable = true;
        userName = "Zbolt50";
        userEmail = "zekeboggs10@gmail.com";
        extraConfig.init.defaultBranch = "main";
  };
}
