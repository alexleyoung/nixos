{

  description = "alex flakington";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs"; # make sure version match
    # nix-gc-env.url = "github:Julow/nix-gc-env";
  };

  outputs = {self, nixpkgs, home-manager, ...}@inputs:
  let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    # mk_nixos = path:
    #     import "${inputs.nixpkgs}/nixos/lib/eval-config.nix" {
    #       system = "x86_64-linux";
    #       # Make sure to pass inputs as special args to make nix-gc-env
    #       # available to the configuration:
    #       specialArgs = inputs;
    #       modules = [ path ];
    #     };
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
