{ lib, pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      hello
    ];

    username = "jokyv";
    homeDirectory = "/home/jokyv";

    stateVersion = "24.05";
  };
}
