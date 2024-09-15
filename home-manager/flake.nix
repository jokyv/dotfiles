{
  description = "My Home Manager configuration";

  inputs = {
    # stable
    # nixpkgs.url = "nixpkgs/nixos-24.05";
    # home-manager.url = "github:nix-community/home-manager/release-24.05";
    # home-manager.inputs.nixpkgs.follows = "nixpkgs-stable";

    # unstable
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix";
    # compile helix from source
    # helix.url = "github:helix-editor/helix"; 
  };

  outputs = { self, nixpkgs, home-manager, stylix, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations = {
        jokyv = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home.nix
            stylix.homeManagerModules.stylix
          ];
        };
      };
    };
}
