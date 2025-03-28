{ pkgs, lib, ... }:
{
    # TODO : Fix this shit later
    breeze-icons-red = pkgs.stdenv.mkDerivation {
        name = "breeze-icons-red";

        src = pkgs.fetchFromGitHub {
          owner = "L4ki";
          repo = "Breeze-Red-Black-Icons";
          rev = "master";
          #sha256 = "07rxhzw3j1cmqm7qfvaglm2jfhpv8asg0dgfaa458bk4956sx0sb";
        };

        installPhase = ''
            mkdir -p $out/share/icons
            cp -r $src $out/share/icons/breeze-red
        '';
    };
}
