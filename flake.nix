{
  description = "skylers scuffed flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, home-manager, niri, stylix, ... }@inputs: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./modules/core/configuration.nix
          stylix.nixosModules.stylix
          niri.nixosModules.niri
	        home-manager.nixosModules.home-manager
	        {
            home-manager.useGlobalPkgs = true;
	          home-manager.useUserPackages = true;
	          home-manager.users.skyler = {
              imports = [
                ./modules/home/home.nix
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
