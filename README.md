# Dotfiles

Personal dotfiles for shell and git configuration.

## Install

**Symlink method** (recommended):
```bash
brew install stow  # if not installed
cd ~/dotfiles
./install-stow.sh
```

**Copy method**:
```bash
cd ~/dotfiles
./install-copy.sh
```

Existing files are automatically backed up to `~/dotfiles_backup_*`

## Update

**Symlink method**: Edit files in `~/dotfiles/` — changes apply immediately

**Copy method**: Edit files in `~/dotfiles/` then run `./install-copy.sh` again
