# flake.nix
{
  description = "My Home Manager configuration";

  inputs = {
    # stable
    # nixpkgs.url = "nixpkgs/nixos-24.05";
    # home-manager.url = "github:nix-community/home-manager/release-24.05";

    # unstable
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # compile helix from source
    # helix.url = "github:helix-editor/helix"; 
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = import nixpkgs { inherit system; };
    in
    {
      homeConfigurations = {
        my_profile = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home.nix ];
          # modules = [ ./home.nix ./helix.nix];
          # extraSpecialArgs = {helix-flake = helix;      };
        };
      };
    };
}
