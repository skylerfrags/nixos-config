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

   zen-browser = {
    url = "github:0xc000022070/zen-browser-flake";
    inputs.nixpkgs.follows = "nixpkgs";
   };

  };

  outputs = { self, nixpkgs, home-manager, niri, zen-browser, ... }@inputs: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./modules/core/configuration.nix
          niri.nixosModules.niri
	        home-manager.nixosModules.home-manager
	        {
            home-manager.useGlobalPkgs = true;
	          home-manager.useUserPackages = true;
	          home-manager.users.skyler = {
              imports = [
                ./modules/home/home.nix
                inputs.zen-browser.homeModules.twilight
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
