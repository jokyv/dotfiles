{ config, pkgs, ... }:

{
  imports = [
    ./modules/firefox.nix
    ./modules/fastfetch.nix
    ./modules/stylix.nix
    ./modules/zathura.nix
    ./modules/foot.nix
    # ./modules/ly.nix
  ];


  home.username = "jokyv";
  home.homeDirectory = "/home/jokyv";

  # install packages with their default configs
  home.packages = with pkgs; [
    # alacritty
    base16-schemes
    brave
    dprint
    fastfetch
    helix
    just
    nixpkgs-fmt
    # nixfmt-rfc-style
    # nil
    nixd
    trashy
    vscode-langservers-extracted
    zathura
    # wlogout  
    libreoffice-qt-fresh # no space left for this app
    # onlyoffice-bin
    psst
    gitleaks
    cowsay
    # nh # move to NixOS first!
    # nemo
    nautilus
    nom
    xonsh
    nushell
    ddgr
    tabiew
    virtualenv # need this for python virtual env
  ];

  nixpkgs.config.allowUnfreePredicate = 
    pkg: builtins.elem (pkgs.lib.getName pkg) [
      "discord"
    ];

  home.stateVersion = "24.05";

  # nh
  # programs.nh = {
  #   enable = true;
  #   clean.enable = true;
  #   clean.extraArgs = "--keep-since 4d --keep 3";
  #   flake = "/home/jokyv/dot/home-manager";
  # };

  # install packages AND specify their configs
  #
  # network settings
  # networking = {
  #   hostname = "";
  #   networkmanager.enable = true;
  #   firewall = {
  #     enable = true;
  #     allowedTCPPorts = [ ];
  #   };
  # };
  #
  # environment variables
  # environment.variables = {
  #   SECRET_KEY = "";
  #   PATH = [ "" ];
  #   EDITOR = "hx"
  # };
  #
  # session variables
  # home.sessionVariables = {
  # HISTFILE = "/home/jokyv/.bash_history"
  # CARGO_HOME = "/home/jokyv/.cargo"
  # }
  #
  # User management
  # users.users.jokyv = {
  #   isNormalUser = true;
  #   home = "/home/jokyv";
  #   extraGroups = [ "wheel" "networkmanager"];
  #   openssh.authorizedkeys.kyes = [
  #     "ssh-rsa ..."
  #   ];
  # };

  # syncs automatically the repo with github
  #services.git-sync = {
  #  enable = true;
  #  repositories = {
  #    "my-repo" = {
  #      path = "/home/jokyv/xxx/xxxx";
  #      uri = "https://github.com/user/repo.git";
  #     interval = "300"; # Sync every 5 minutes
  #    };
  #  };
  #};

  programs.home-manager.enable = true;
  # programs.home-manager.useGlobalPkgs = true;
  # programs.home-manager.useUserPackages = true;

  # ---------------------------------------------
  # Create specific folders in home directory
  # ---------------------------------------------

  # home.file = {
  #   "downloads".source = config.lib.file.mkOutOfStoreSymlink "/home/${config.home.username}/downloads";
  #   "projects".source = config.lib.file.mkOutOfStoreSymlink "/home/${config.home.username}/projects";
  #   "pics".source = config.lib.file.mkOutOfStoreSymlink "/home/${config.home.username}/pics";
  # };

  # ---------------------------------------------
  # Set XDG user directories
  # ---------------------------------------------

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
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
