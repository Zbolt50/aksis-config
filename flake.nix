{
  description = "Boggle's NEW NixOS Config";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable"; 
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";  
    }; 
    stylix.url = "github:danth/stylix";
    # Handles the hardware for things like laptops
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    #firefox-addons = { 
      #url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      #inputs.nixpkgs.follows = "nixpkgs"; 
    #};
  };

  outputs = {
  nixpkgs, 
  home-manager, 
  stylix, 
  nixos-hardware,
  ... 
  } @inputs: let
    system = "x86_64-linux";
    host  = "thinkpad";
    username = "boggle"; 
    hostname = "aksis"; 
    lib = nixpkgs.lib;

  in {

    nixosConfigurations = {
      thinkpad = nixpkgs.lib.nixosSystem {
        inherit system; 
        specialArgs = {
          inherit inputs; 
          inherit username; 
          inherit host; 
          inherit hostname;
          #inherit hostVars;
        };
        modules = [ 
        ./profiles/intel
	    # Hardware for T480
	    nixos-hardware.nixosModules.lenovo-thinkpad-t480
        ];
      };
    };
  };
}
