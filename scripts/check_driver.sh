#!/bin/bash

# typical figure for a 250GB SSD lies between 60 and 150 terabytes written
# https://www.ontrack.com/blog/2018/02/07/how-long-do-ssds-really-last/
sudo smartctl -a /dev/nvme0n1
