{ pkgs, lib, ... }:

{
  home.sessionVariables = {
    GTK_THEME = "Catppuccin-Mocha-Compact-Maroon-Dark";
  };

  stylix = {
    enable = true;
    autoEnable = true;
    image = ./../wallpaper.jpg;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest.yaml";

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Amber";
      size = 20;
    };

    # fonts =
    #   let
    #     inherit (config.fontProfiles) regular monospace emoji;
    #   in
    #   {
    #     inherit monospace emoji;
    #     serif = regular;
    #     sansSerif = regular;
    #     sizes = {
    #       applications = 12;
    #       desktop = 12;
    #       popups = 12;
    #       terminal = 14;
    #     };
    #   };

    opacity = {
      applications = 0.9;
      desktop = 0.9;
      popups = 0.9;
      terminal = 0.9;
    };

    # image = nix-colors-lib.nixWallpaperFromScheme {
    #   scheme = config.colorscheme;
    #   width = 1366;
    #   height = 768;
    #   logoScale = 3.0;
    # };
  };

  xdg.configFile."Kvantum/kvantum.kvconfig".source = (pkgs.formats.ini { }).generate "kvantum.kvconfig" {
    # ls ~/.nix-profile/share/Kvantum/*/*.kvconfig
    General.theme = "Catppuccin-Mocha-Maroon";
  };

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = lib.mkForce "kvantum";
  };

  gtk = {
    enable = true;
    iconTheme = {
      # name = "Papirus-Dark";
      # package = pkgs.papirus-icon-theme;
      # name = "Tela";
      # package = pkgs.tela-icon-theme;
      name = "everforest";
      package = pkgs.everforest-gtk-theme;
    };
  };

  home.packages = [
    pkgs.libsForQt5.qtstyleplugin-kvantum
    pkgs.catppuccin-qt5ct
    (pkgs.catppuccin-kvantum.override {
      variant = "Mocha";
      accent = "Maroon";
    })
  ];
}

