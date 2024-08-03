{ lib, pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      btop
      htop
    # fortune
      brave
      nil
      dprint
      trashy
      helix
    ];

    username = "jokyv";
    homeDirectory = "/home/jokyv";

    stateVersion = "24.05";
  };
  programs.home-manager.enable = true;
}
