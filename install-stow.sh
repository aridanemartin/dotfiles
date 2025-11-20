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

# Create backup directory with timestamp
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
BACKUP_NEEDED=false

# Check if any files exist that need backup
for file in .aliases .zshrc .gitconfig; do
    if [ -f "$HOME/$file" ] && [ ! -L "$HOME/$file" ]; then
        BACKUP_NEEDED=true
        break
    fi
done

# Create backup directory and backup files if needed
if [ "$BACKUP_NEEDED" = true ]; then
    mkdir -p "$BACKUP_DIR"
    echo -e "${YELLOW}Backing up existing dotfiles to $BACKUP_DIR${NC}"
    
    for file in .aliases .zshrc .gitconfig; do
        if [ -f "$HOME/$file" ] && [ ! -L "$HOME/$file" ]; then
            cp "$HOME/$file" "$BACKUP_DIR/$file"
            echo -e "  ${GREEN}✓${NC} Backed up $file"
        fi
    done
    echo ""
fi

# Use stow to create symlinks
echo -e "${GREEN}Creating symlinks with stow...${NC}"
stow -v zsh
stow -v git

echo -e "\n${GREEN}✓ Installation complete!${NC}"
echo -e "${YELLOW}Note: Source your shell configuration:${NC}"
echo "  source ~/.zshrc"

if [ "$BACKUP_NEEDED" = true ]; then
    echo -e "\n${YELLOW}Your original files have been backed up to: $BACKUP_DIR${NC}"
fi
