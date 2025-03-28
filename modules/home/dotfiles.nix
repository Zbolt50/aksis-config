{ config, pkgs, lib, ... }:
# gonna delete this later, just to import old-dotfiles before I nixify them
{

xdg.configFile = {                                                                                                                                                                     
 "nvim" = {                                                                                                                                                                           
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/boggle-neo/.config/nvim";                                                                             
      recursive = true;                                                                                                                                                                
  };                                                                                                                                                                                   
};                                                                                                                                                                                     
xdg.configFile = {                                                                                                                                                                     
  "dunst" = {                                                                                                                                                                          
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/boggle-neo/.config/dunst";                                                                            
      recursive = true;                                                                                                                                                                
  };                                                                                                                                                                                   
};                                                                                                                                                                                     
}
