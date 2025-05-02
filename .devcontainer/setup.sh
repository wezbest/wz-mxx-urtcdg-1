#!/usr/bin/env bash

set -euxo pipefail

# ----------------------
# Install Dependencies
# ----------------------
sudo apt update && sudo apt install -y \
  curl \
  wget \
  gnupg \
  git \
  build-essential \
  software-properties-common \
  libssl-dev

# ----------------------
# Install Latest Python (3.12)
# ----------------------
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt update
sudo apt install -y python3.12

python3 --version || true

# ----------------------
# Install Latest Go (1.22.x)
# ----------------------
GO_VERSION="1.22.0"
wget https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz

echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
echo 'export GOPATH=$HOME/go' >> ~/.bashrc
source ~/.bashrc

go version || true

# ----------------------
# Install Latest Rust
# ----------------------
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

source "$HOME/.cargo/env"

rustc --version || true
cargo --version || true

# ----------------------
# Install Fish Shell (3.6+)
# ----------------------
sudo apt-add-repository ppa:fish-shell/release-3 -y
sudo apt update
sudo apt install -y fish

fish --version || true

# Set Fish as default shell for user
sudo chsh -s $(which fish) $(whoami)

# ----------------------
# Install Homebrew (Linuxbrew)
# ----------------------
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

brew --version || true

# Optional: Install brew packages (uncomment if needed)
# brew install starship fzf fd ripgrep

# ----------------------
# Done!
# ----------------------
echo "✅ Setup complete! Python, Go, Rust, Fish, and Brew installed."
