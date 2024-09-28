{ pkgs, lib, ... }:

{
  # home.sessionVariables = {
  #   # GTK_THEME = "Catppuccin-Mocha-Compact-Maroon-Dark";
  #   GTK_THEME = "Everforest-Dark";
  # };

  stylix = {
    enable = true;
    autoEnable = true;
    image = ./../wallpaper.jpg;
    polarity = "dark";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest.yaml";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest-dark-hard.yaml";

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Amber";
      size = 28;
    };

    fonts =
      {
        monospace = {
          # https://www.nerdfonts.com/font-downloads
          package = pkgs.nerdfonts.override { fonts = [ "MartianMono" "FiraCode" ]; };
          name = "MartianMono Nerd Font";
        };
        serif = {
          package = pkgs.dejavu_fonts;
          name = "DejaVu Serif";
        };
        sansSerif = {
          package = pkgs.noto-fonts;
          name = "Noto Sans";
        };
        emoji = {
          package = pkgs.noto-fonts-monochrome-emoji;
          name = "Noto Emoji";
        };
        sizes = {
          terminal = 14;
          applications = 12;
          popups = 12;
          desktop = 12;
        };
      };


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
      name = "Tela";
      package = pkgs.tela-icon-theme;
      # name = "everforest";
      # package = pkgs.everforest-gtk-theme;
      # name = "candy";
      # package = pkgs.candy-icons;
      # name = "sweet";
      # package = pkgs.sweet-folders;
    };
    # theme = {
    #   name = "Everforest-Dark-B";
    #   package = pkgs.everforest-gtk-theme;
    # };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
  };

  dconf.settings = {
    "org/gnome/nautilus/icon-view" = {
      default-zoom-level = "standard";
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
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

