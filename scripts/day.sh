#!/bin/bash

# SCRIPTS
# ----------------------------------------------------------------------------
# a simple script that prints the date to the format i want for my notes
day() {
  date_now=$(date +"%A, %d %B %Y")
  echo "$date_now"
}

day()