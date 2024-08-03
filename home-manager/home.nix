{ lib, pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      btop
      htop
      brave
      nil
      dprint
      trashy
      helix
      marksman
      vscode-langservers-extracted
    ];

    username = "jokyv";
    homeDirectory = "/home/jokyv";

    stateVersion = "24.05";
  };
  programs.home-manager.enable = true;
  programs.helix.enable = true;
}
