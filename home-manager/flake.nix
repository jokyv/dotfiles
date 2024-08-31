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

  outputs = { nixpkgs, home-manager, ... }: {
    homeConfigurations."jokyv" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [ ./home.nix ];
    };
  };
}
