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

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, home-manager, catppuccin, niri, ... }@inputs: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./modules/core/configuration.nix
          catppuccin.nixosModules.catppuccin
          niri.nixosModules.niri
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
          # passes inputs to all modules
          { _module.args = { inherit inputs; }; }
        ];
      };
    };
  };
}
