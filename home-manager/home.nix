{ config, pkgs, ... }:

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
    fastfetch
    base16-schemes
  ];

  home.stateVersion = "24.05";

  stylix.enable = true;
  stylix.image = ./wallpaper.jpg;
  stylix.polarity = "dark";
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest.yaml";

  # install packages AND specify their configs
  # gtk settings
  # gtk = {
  #   enable = true;
  #   theme.name = "adw-gtk3";
  #   cursorTheme.name = "Bibata-Modern-Ice";
  #   iconTheme.name = "GruvboxPlus";
  # };
  #
  # network settings
  # networking = {
  #   hostname = "";
  #   networkmanager.enable = true;
  #   firewall = {
  #     enabe = true;
  #     allowedTCPPorts = [ ];
  #   };
  # };
  #
  # enviroment variables
  # enviroment.variables = {
  #   SECRET_KEY = "";
  #   PATH = [ "" ];
  # };
  #
  # User management
  # users.users.jokyc = {
  #   isNormalUser = true;
  #   home = "/home/jokyv";
  #   extraGroups = [ "wheel" "networkmanager"];
  #   openssh.authorizedkeys.kyes = [
  #     "ssh-rsa ..."
  #   ];
  # };

  programs.home-manager.enable = true;

  # programs.helix.enable = true;
  # programs.helix.settings.theme = "autumn_night_transparent";
}
