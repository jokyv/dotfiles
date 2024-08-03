{
  config,
  pkgs,
  helix-flake,
  ...
}: {
  programs.helix = {
    enable = true;
    package = helix-flake.packages.${pkgs.system}.default;
    # ...
   };
}
