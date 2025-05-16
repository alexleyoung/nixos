{

  description = "alex flakington";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs"; # make sure version match
  };

  outputs = {self, nixpkgs, home-manager, ...}@inputs:
  let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
	modules = [ ./profiles/nix-pc/configuration.nix ];
      };
    };

    homeConfigurations = {
      alexy = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
	modules = [ ./profiles/nix-pc/home.nix ];
      };
    };
  };

}
