{
  description = "Boggle's NEW NixOS Config";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #stylix.url = "github:danth/stylix";
    nixtendo-switch = {
      url = "github:nyawox/nixtendo-switch";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      #stylix,
      nixtendo-switch,
      nixos-hardware,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      username = "boggle";
    in
    {

      nixosConfigurations = {
        thinkpad = nixpkgs.lib.nixosSystem {
          # Find a way to inherit the host name from this and not manually typing it out in the variable
          inherit system;
          specialArgs = {
            inherit inputs;
            inherit username;
            hostname = "aksis";
            host = "thinkpad";
          };
          modules = [
            #./profiles/intel
            ./hosts/thinkpad/default.nix
            # Hardware for T480
            nixos-hardware.nixosModules.lenovo-thinkpad-t480
          ];
        };
        # Desktop Config
        desktop = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
            inherit username;
            hostname = "saladin";
            host = "desktop";
          };
          modules = [
            ./hosts/desktop/default.nix
          ];
        };
      };
    };
}
