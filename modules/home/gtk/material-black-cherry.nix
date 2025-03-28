{ pkgs, ... }:
{
    material-black-cherry = pkgs.stdenv.mkDerivation {
        name = "material-black-cherry";

        src = pkgs.fetchFromGitHub {
          owner = "rtlewis1";
          repo = "GTK";
          rev = "Material-Black-Colors-Desktop";
          #hash = pkgs.lib.fakeSha256;
          #sha256 = "6d6c480a392ba666d2f5d3da4f8bf76c23f9f70b";
          sha256 = "1lb2wwnb9wdv7kcbrqmkbbn95vvq6zv7gf6h1w4x81961d68q27h";
        };

        installPhase = ''
            mkdir -p $out/share/themes
            cp -r $src/Material-Black-Cherry $out/share/themes/
        '';
    };
}
