{ lib, pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      btop
      htop
      brave
      nil
      marksman
      vscode-langservers-extracted
      dprint
      trashy
      helix
    ];

    username = "jokyv";
    homeDirectory = "/home/jokyv";

    stateVersion = "24.05";
  };
  programs.home-manager.enable = true;
  # programs.helix.enable = true;
  # programs.helix.settings.theme = "autumn_night_transparent";
}
