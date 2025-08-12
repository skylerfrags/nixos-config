{
  description = "skylers scuffed flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    catppuccin = {
      url = "github:catppuccin/nix";
    };

  };

  outputs = { self, nixpkgs, catppuccin, ... }@inputs:
  
  {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          ./programs.nix
          ./catppuccin.nix
          catppuccin.nixosModules.catppuccin
        ];
      };
    };
  };
}
