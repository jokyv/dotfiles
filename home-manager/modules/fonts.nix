{ pkgs, ... }:

{
  fontProfiles = {
    enable = true;
    regular = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans";
    };
    monospace = {
      package = pkgs.nerdfonts.override { fonts = [ "MartianMono" "FiraCode" ]; };
      name = "MartianMono Nerd Font";
    };
    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
      # package = pkgs.noto-fonts-emoji-blob-bin;
      # name = "Blobmoji";
      # package = pkgs.twitter-color-emoji;
      # name = "Twitter Color Emoji";
    };
  };
}
