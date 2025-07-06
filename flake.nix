{
  description = "skylers scuffed flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, home-manager, catppuccin, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./modules/core/configuration.nix

	      home-manager.nixosModules.home-manager
	      {
          home-manager.useGlobalPkgs = true;
	        home-manager.useUserPackages = true;
	        home-manager.users.skyler = {
            imports = [
              ./modules/home/home.nix
              catppuccin.homeModules.catppuccin
            ];
          };
	      }
      ];
    };
  };
}
