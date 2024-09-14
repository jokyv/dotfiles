#!/usr/bin/env bash

home-manager switch --flake .#jokyv
nix-collect-garbage --delete-older-than 7d
