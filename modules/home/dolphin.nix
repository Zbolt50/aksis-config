{ pkgs, ... }:
{
    # Might migrate KDE stuff into seperate folder. 
    environment.systemPackages = with pkgs; [
         dolphin
         kdePackages.qtwayland
         kdePackages.qtsvg
         kdePackages.kio-fuse
         kdePackages.kio-extras
    ];
}
