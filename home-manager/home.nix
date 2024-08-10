{ lib, pkgs, ... }:
{
  home.username = "jokyv";
  home.homeDirectory = "/home/jokyv";

  # install packages with their default configs
  home.packages = with pkgs; [
    brave
    nil
    nixpkgs-fmt
    vscode-langservers-extracted
    dprint
    trashy
    helix
    wlogout
  ];

  home.stateVersion = "24.05";

  # install packages AND specify their configs
  # gtk = {
  #   enable = true;
  #   theme.name = "adw-gtk3";
  #   cursorTheme.name = "Bibata-Modern-Ice";
  #   iconTheme.name = "GruvboxPlus";
  # }

  programs.home-manager.enable = true;

  # programs.helix.enable = true;
  # programs.helix.settings.theme = "autumn_night_transparent";
}
