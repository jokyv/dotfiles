#!/usr/bin/env bash

home-manager switch --flake .#my_profile
nix-collect-garbage -d
