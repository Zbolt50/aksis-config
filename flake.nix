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
      # Find a way to inherit the host name from this and not manually typing it out in the variable
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
        # move this to ./profiles/intel later
	    nixos-hardware.nixosModules.lenovo-thinkpad-t480
        ];
      };
    };
  };
}
