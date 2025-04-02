{ pkgs, ... }:
let
  gtkTheme = import ./material-black-cherry.nix { inherit pkgs; };
in
{
  home.packages = [ pkgs.dconf ];
  gtk = {
    enable = true;
    theme = {
      package = gtkTheme.material-black-cherry;
      name = "Material-Black-Cherry";
    };
    iconTheme = {
      package = pkgs.kdePackages.breeze-icons;
      name = "breeze";
    };
    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };
  };
}
