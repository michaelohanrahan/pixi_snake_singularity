#!/bin/bash

# Create the directory
mkdir -p ~/pixi_container_snake

# Copy files from Windows to WSL
cp -r /mnt/c/git/pixi_container_snake/* ~/pixi_container_snake/

# Change to the new directory
cd ~/pixi_container_snake

# Run snakemake with singularity
# pixi run snakemake -s --use-singularity

# Optional: Change back to the original directory
# cd /mnt/c/git/pixi_container_snake