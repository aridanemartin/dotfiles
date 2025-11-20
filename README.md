# Dotfiles Repository

A personal dotfiles repository for managing shell configurations and development environment settings.

## 📁 Structure

```
dotfiles/
├── zsh/
│   ├── .aliases      # Shell aliases for common commands
│   └── .zshrc        # Zsh configuration (sources aliases)
├── install-stow.sh   # Installation script using GNU Stow (symlinks)
├── install-copy.sh   # Installation script using direct copy
└── README.md         # This file
```

## 🚀 Installation

You have two options for installing these dotfiles:

### Option 1: Stow Method (Recommended)

This method creates symlinks from your home directory to the dotfiles repository, making it easy to keep everything in sync.

**Requirements:** GNU Stow must be installed
```bash
# macOS
brew install stow

# Linux (Debian/Ubuntu)
sudo apt install stow

# Linux (RHEL/CentOS)
sudo yum install stow
```

**Install:**
```bash
cd ~/dotfiles
./install-stow.sh
```

**Benefits:**
- Changes in the repo are immediately reflected in your home directory
- Easy to track and version control your dotfiles
- Clean uninstall: `cd ~/dotfiles && stow -D zsh`

### Option 2: Copy Method

This method directly copies files to your home directory.

**Install:**
```bash
cd ~/dotfiles
./install-copy.sh
```

**Benefits:**
- No additional dependencies required
- Files are independent of the repository
- Simpler for one-time setups

## 📝 Included Aliases

Current shell aliases:
- `ni` - npm install
- `ns` - npm start
- `nd` - npm run dev
- `yi` - yarn install
- `ys` - yarn start
- `c` - clear

## 🔄 Updating

### If using Stow method:
Just edit files in the `~/dotfiles/zsh/` directory and the changes will be reflected immediately.

### If using Copy method:
1. Edit files in `~/dotfiles/zsh/`
2. Run `./install-copy.sh` again to copy updated files

## 🗂️ Adding More Dotfiles

To add configuration for other tools:

1. Create a new directory (e.g., `vim/`, `git/`, `tmux/`)
2. Add your dotfiles to that directory (e.g., `vim/.vimrc`)
3. Update the installation scripts to include the new directory
4. If using stow: `stow vim`

## ⚠️ Backup

Both installation scripts automatically backup existing files with a `.backup` extension before making changes.

## 📦 Git Setup

To version control your dotfiles:

```bash
cd ~/dotfiles
git init
git add .
git commit -m "Initial commit"
git remote add origin <your-repo-url>
git push -u origin main
```

## 🔗 Useful Resources

- [GNU Stow Documentation](https://www.gnu.org/software/stow/)
- [Dotfiles Guide](https://dotfiles.github.io/)
