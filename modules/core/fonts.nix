{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      noto-fonts-emoji 
      font-awesome                                                                                                                                                                         
      nerd-fonts.jetbrains-mono                                                                                                                                                            
      nerd-fonts.gohufont    
    ]; 
  };
}
