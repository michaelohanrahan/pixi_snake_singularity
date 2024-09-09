#!/bin/bash

# Install pixi if not already installed
if ! command -v pixi &> /dev/null; then
    echo "Installing pixi..."
    curl -fsSL https://pixi.sh/install.sh | bash
    export PATH="$HOME/.pixi/bin:$PATH"
else
    echo "pixi is already installed."
fi

# Install dependencies with pixi
echo "Installing dependencies..."
pixi install

# Add pixi's bin to PATH
export PATH="$HOME/.pixi/env/bin:$PATH"