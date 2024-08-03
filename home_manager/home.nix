{ lib, pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      hello
      htop
    # fortune
      brave
      nil
      dprint
      trashy
    ];

    username = "jokyv";
    homeDirectory = "/home/jokyv";

    stateVersion = "24.05";
  };
}
