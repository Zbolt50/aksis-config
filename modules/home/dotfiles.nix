{
  config,
  ...
}:
# gonna delete this later, just to import old-dotfiles before I nixify them
{
  xdg.configFile = {
    "dunst" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/boggle-neo/.config/dunst";
      recursive = true;
    };
  };
}
