#!/usr/bin/env bash

# Dotfiles Installation Script (Using GNU Stow)
# This script creates symlinks from your home directory to the dotfiles repo

set -e

DOTFILES_DIR="$HOME/dotfiles"
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}=== Dotfiles Installation (Stow Method) ===${NC}\n"

# Check if stow is installed
if ! command -v stow &> /dev/null; then
    echo -e "${RED}Error: GNU Stow is not installed.${NC}"
    echo -e "${YELLOW}Install it with:${NC}"
    echo "  macOS: brew install stow"
    echo "  Linux: sudo apt install stow (Debian/Ubuntu) or sudo yum install stow (RHEL/CentOS)"
    exit 1
fi

# Check if dotfiles directory exists
if [ ! -d "$DOTFILES_DIR" ]; then
    echo -e "${RED}Error: Dotfiles directory not found at $DOTFILES_DIR${NC}"
    exit 1
fi

cd "$DOTFILES_DIR"

# Backup existing files
backup_if_exists() {
    local file=$1
    if [ -f "$HOME/$file" ] && [ ! -L "$HOME/$file" ]; then
        echo -e "${YELLOW}Backing up existing $file to ${file}.backup${NC}"
        mv "$HOME/$file" "$HOME/${file}.backup"
    fi
}

echo "Backing up existing dotfiles (if any)..."
backup_if_exists ".aliases"
backup_if_exists ".zshrc"

# Use stow to create symlinks
echo -e "\n${GREEN}Creating symlinks with stow...${NC}"
stow -v zsh

echo -e "\n${GREEN}✓ Installation complete!${NC}"
echo -e "${YELLOW}Note: Source your shell configuration:${NC}"
echo "  source ~/.zshrc"
echo -e "\n${YELLOW}Your original files have been backed up with .backup extension${NC}"
