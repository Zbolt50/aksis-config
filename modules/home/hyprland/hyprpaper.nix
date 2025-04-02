{ pkgs, ... }:
{
    services.hyprpaper = {
        enable = true;
        settings = {
            ipc = "on";
            splash = false;
            splash_offset = 2.0;

            preload = [
                "~/aksis-config/modules/stylix/wallpapers/sivawallpaper.png"
            ];
            
            wallpaper = [
                ",~/aksis-config/modules/stylix/wallpapers/sivawallpaper.png"
            ];
        };
    };
}
