{ pkgs }:

{
  fonts = {
    enable = true;

    fontconfig = {
      # Default system-wide fonts
      defaultFonts = [
        pkgs.ibm-plex
        pkgs.source-code-pro
      ];

      # Fonts specifically for terminal apps
      perApp = [
        {
          pattern = "kitty";
          fonts = [ pkgs.fira-code ];
        }
      ];

      # Fonts specifically for Firefox
      perApp = [
        {
          pattern = "firefox";
          fonts = [ pkgs.ibm-plex ];
        }
      ];
    };
  };
}

