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

# Create backup directory with timestamp
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
BACKUP_NEEDED=false

# Check if any files exist that need backup
for file in .aliases .zshrc .gitconfig; do
    if [ -f "$HOME/$file" ]; then
        BACKUP_NEEDED=true
        break
    fi
done

# Create backup directory and backup files if needed
if [ "$BACKUP_NEEDED" = true ]; then
    mkdir -p "$BACKUP_DIR"
    echo -e "${YELLOW}Backing up existing dotfiles to $BACKUP_DIR${NC}"
    
    for file in .aliases .zshrc .gitconfig; do
        if [ -f "$HOME/$file" ]; then
            cp "$HOME/$file" "$BACKUP_DIR/$file"
            echo -e "  ${GREEN}✓${NC} Backed up $file"
        fi
    done
    echo ""
fi

# Copy dotfiles
echo -e "${GREEN}Copying dotfiles...${NC}"

if [ -f "$DOTFILES_DIR/zsh/.aliases" ]; then
    cp -v "$DOTFILES_DIR/zsh/.aliases" "$HOME/.aliases"
    echo -e "${GREEN}✓ Copied .aliases${NC}"
fi

if [ -f "$DOTFILES_DIR/zsh/.zshrc" ]; then
    cp -v "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
    echo -e "${GREEN}✓ Copied .zshrc${NC}"
fi

if [ -f "$DOTFILES_DIR/git/.gitconfig" ]; then
    cp -v "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"
    echo -e "${GREEN}✓ Copied .gitconfig${NC}"
fi

echo -e "\n${GREEN}✓ Installation complete!${NC}"
echo -e "${YELLOW}Note: Source your shell configuration:${NC}"
echo "  source ~/.zshrc"

if [ "$BACKUP_NEEDED" = true ]; then
    echo -e "\n${YELLOW}Your original files have been backed up to: $BACKUP_DIR${NC}"
fi
