#!/usr/bin/env bash

# Dotfiles Installation Script (Direct Copy Method)
# This script copies dotfiles directly to your home directory

set -e

DOTFILES_DIR="$HOME/dotfiles"
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}=== Dotfiles Installation (Copy Method) ===${NC}\n"

# Check if dotfiles directory exists
if [ ! -d "$DOTFILES_DIR" ]; then
    echo -e "${RED}Error: Dotfiles directory not found at $DOTFILES_DIR${NC}"
    exit 1
fi

# Backup existing files
backup_if_exists() {
    local file=$1
    if [ -f "$HOME/$file" ]; then
        echo -e "${YELLOW}Backing up existing $file to ${file}.backup${NC}"
        cp "$HOME/$file" "$HOME/${file}.backup"
    fi
}

echo "Backing up existing dotfiles (if any)..."
backup_if_exists ".aliases"
backup_if_exists ".zshrc"

# Copy dotfiles
echo -e "\n${GREEN}Copying dotfiles...${NC}"

if [ -f "$DOTFILES_DIR/zsh/.aliases" ]; then
    cp -v "$DOTFILES_DIR/zsh/.aliases" "$HOME/.aliases"
    echo -e "${GREEN}✓ Copied .aliases${NC}"
fi

if [ -f "$DOTFILES_DIR/zsh/.zshrc" ]; then
    cp -v "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
    echo -e "${GREEN}✓ Copied .zshrc${NC}"
fi

echo -e "\n${GREEN}✓ Installation complete!${NC}"
echo -e "${YELLOW}Note: Source your shell configuration:${NC}"
echo "  source ~/.zshrc"
echo -e "\n${YELLOW}Your original files have been backed up with .backup extension${NC}"
