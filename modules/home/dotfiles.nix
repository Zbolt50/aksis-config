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
  "tmux" = {                                                                                                                                                                           
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/boggle-neo/.config/tmux";                                                                             
      recursive = true;                                                                                                                                                                
  };                                                                                                                                                                                   
};                                                                                                                                                                                     
xdg.configFile = {                                                                                                                                                                     
  "wofi" = {                                                                                                                                                                           
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/boggle-neo/.config/wofi";                                                                             
      recursive = true;                                                                                                                                                                
  };                                                                                                                                                                                   
};                                                                                                                                                                                     
xdg.configFile = {                                                                                                                                                                     
  "hypr" = {                                                                                                                                                                           
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/boggle-neo/.config/hypr";                                                                             
      recursive = true;                                                                                                                                                                
  };                                                                                                                                                                                   
};                                                                                                                                                                                     
xdg.configFile = {                                                                                                                                                                     
  "dunst" = {                                                                                                                                                                          
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/boggle-neo/.config/dunst";                                                                            
      recursive = true;                                                                                                                                                                
  };                                                                                                                                                                                   
};                                                                                                                                                                                     
xdg.configFile = {                                                                                                                                                                     
  "waybar" = {                                                                                                                                                                         
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/boggle-neo/.config/waybar";                                                                           
      recursive = true;                                                                                                                                                                
  };                                                                                                                                                                                   
};           
}
