#!/bin/bash

test_startup() {
  hyperfine --warmup 10 --ignore-failure "nvim +q" "lvim +q"
}

test_startup
