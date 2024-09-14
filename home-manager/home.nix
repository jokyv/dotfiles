{ config, pkgs, ... }:

{
  imports = [
    ./modules/firefox.nix
    # ./modules/ly.nix
  ];

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
    just
  ];

  home.stateVersion = "24.05";

  # stylix configs
  stylix.enable = true;
  stylix.image = ./wallpaper.jpg;
  stylix.polarity = "dark";
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest.yaml";

  stylix.cursor.package = pkgs.bibata-cursors;
  stylix.cursor.name = "Bibata-Modern-Ice";

  stylix.targets.gtk.enable = true;
  stylix.targets.alacritty.enable = true;
  stylix.targets.mako.enable = true;
  stylix.targets.swaylock.enable = true;
  stylix.targets.yazi.enable = true;
  stylix.targets.zathura.enable = true;
  stylix.targets.firefox.enable = true;
  stylix.targets.fuzzel.enable = true;
  # stylix.targets.ly.enable = true; stylix does not support ly right now
  # stylix.targets.bat.enable = true;
  # stylix.targets.kitty.enable = true;
  # stylix.targets.fzf.enable = true;
  # stylix.targets.helix.enable = true;

  # stylix.theme = {
  #   gtk.enable = true;
  #   gtk.iconTheme = {
  #     name = "everforest";
  #     package = pkgs.everforest-gtk-theme;
  #   };
  # };

  # gtk settings
  #   gtk = {
  #   enable = true;
  #   iconTheme = {
  #     # name = "Papirus-Dark";
  #     # package = pkgs.papirus-icon-theme;
  #     # name = "Tela";
  #     # package = pkgs.tela-icon-theme;
  #     name = "everforest";
  #     package = pkgs.everforest-gtk-theme;
  #   };
  # };

  # install packages AND specify their configs
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
  #   EDITOR = "hx"
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
  programs.alacritty.enable = true;

  # Create specific folders in home directory
  # home.file = {
  #   "downloads".source = config.lib.file.mkOutOfStoreSymlink "/home/${config.home.username}/downloads";
  #   "projects".source = config.lib.file.mkOutOfStoreSymlink "/home/${config.home.username}/projects";
  #   "pics".source = config.lib.file.mkOutOfStoreSymlink "/home/${config.home.username}/pics";
  # };

  # Set XDG user directories
  xdg.userDirs = {
    enable = true;

    createDirectories = false;
    desktop = "${config.home.homeDirectory}";
    download = "${config.home.homeDirectory}/downloads";
    pictures = "${config.home.homeDirectory}/pics";
    templates = "${config.home.homeDirectory}";
    publicShare = "${config.home.homeDirectory}";
    documents = "${config.home.homeDirectory}";
    music = "${config.home.homeDirectory}";
    videos = "${config.home.homeDirectory}";
    extraConfig = {
      XDG_PROJECTS_DIR = "${config.home.homeDirectory}/projects";
    };
  };
}
