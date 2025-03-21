{
  description = "Boggle's NEW NixOS Config";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable"; 
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";  
    }; 
    stylix.url = "github:danth/stylix";
    # Firefox extensions
    #firefox-addons = { 
      #url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      #inputs.nixpkgs.follows = "nixpkgs"; 
    #};
  };

  outputs = { nixpkgs, home-manager, ... } @inputs: let
    system = "x86_64-linux";
    host  = "thinkpad";
    username = "boggle"; 
    hostname = "aksis"; 
    hostVars = import ./hosts/${host}/variables.nix; 
  in {
    nixosConfigurations = {
      thinkpad = nixpkgs.lib.nixosSystem {
        inherit system; 
        specialArgs = {
          inherit inputs; 
          inherit username; 
          inherit host; 
          inherit hostname;
          inherit hostVars;
        };
        modules = [ 
        ./profiles/intel
        home-manager.nixosModules.home-manager 
        #./modules/home/home.nix
        ];

      };
    };
  };
}
