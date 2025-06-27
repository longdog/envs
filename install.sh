#!/usr/bin/env bash

# Install script for envs - .env files manager

set -euo pipefail

echo "Installing envs - .env files manager"

mkdir -p ~/.local/bin
curl -sSfLo ~/.local/bin/envs https://raw.githubusercontent.com/longdog/envs/main/envs
chmod +x ~/.local/bin/envs

if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    echo "Add ~/.local/bin to your PATH"
fi

echo "Installation complete!"
echo "You can now use 'envs' command in any Git repository"
