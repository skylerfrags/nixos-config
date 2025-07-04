{
  description = "skylers scuffed flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./modules/core/configuration.nix

	      home-manager.nixosModules.home-manager
	      {
          home-manager.useGlobalPkgs = true;
	        home-manager.useUserPackages = true;
	        home-manager.users.skyler = import ./modules/home/home.nix;
	      }
      ];
    };
  };
}
