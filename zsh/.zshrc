# Android SDK
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Console Ninja
export PATH=~/.console-ninja/.bin:$PATH

# Java
export PATH="/usr/local/opt/openjdk@21/bin:$PATH"
export JAVA_HOME="/usr/local/opt/openjdk@21"

# Standard system paths (ensure they're always available)
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/homebrew/bin:$PATH"

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Custom functions
# Create and enter directory
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Quick git operations
gac() {
  git add . && git commit -m "$1"
}

# Find and kill process
fkill() {
  ps aux | grep "$1" | grep -v grep | awk '{print $2}' | xargs kill -9
}

# Quick directory navigation
..() {
  cd ..
}

...() {
  cd ../..
}

....() {
  cd ../../..
}

# Source aliases if the file exists
if [ -f "$HOME/.aliases" ]; then
    source "$HOME/.aliases"
fi
