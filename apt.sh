#!/usr/bin/env bash

# Automatically elevate privileges if not running as root
# if [ "$EUID" -ne 0 ]; then
#   echo "Re-running the script with root privileges..."
#   exec sudo "$0" "$@"
# fi

# Update and upgrade the package list
echo "Updating package list..."
sudo apt update && apt upgrade -y

# List of common CLI applications to install
APPS=(
    "autoconf"        # Automatic configure script builder
    "automake"        # Tool for generating GNU Standards-compliant Makefiles
    "bash-completion" # Bash completion
    "bat"             # Cat command with syntax highlighting
    "build-essential" # Essential compilation tools
    "clang"           # C/C++ compiler
    "coreutils"       # GNU core utilities
    "curl"            # Command-line tool for transferring data with URLs
    "diffutils"       # File comparison utilities
    "dnsutils"        # DNS utilities
    "exiv2"           # Image metadata manipulation tool
    "findutils"       # GNU find utilities
    "fzf"             # Fuzzy file finder
    "gcc"             # GNU Compiler Collection
    "gdb"             # Debugger
    "gettext"         # GNU internationalization library
    "git"             # Version control system
    "git-lfs"         # Git extension for versioning large files
    "gnupg"           # GNU Privacy Guard
    "golang"          # Go programming language
    "gpg"             # GNU Privacy Guard
    "htop"            # Interactive process viewer
    "imagemagick"     # Image manipulation tool
    "jq"              # JSON processor
    "libtool"         # Generic library support script
    "lua5.4"          # Lua programming language
    "lynx"            # Text-based web browser
    "make"            # Build automation tool
    "moreutils"       # Additional Unix utilities
    "mpv"             # Media player
    "neofetch"        # System information tool
    "neovim"          # Vim-fork focused on extensibility and usability
    "net-tools"       # Networking utilities
    "netcat-openbsd"  # TCP/IP swiss army knife
    "nmap"            # Network scanner
    "nodejs"          # JavaScript runtime
    "npm"             # Node.js package manager
    "nvim"            # Neovim text editor
    "openjdk-21-jdk"  # Java Development Kit
    "p7zip-full"      # 7z compression utility
    "p7zip-rar"       # RAR compression utility
    "pigz"            # Parallel gzip
    "pipenv"          # Python dependency manager
    "pkg-config"      # Package config system
    "pv"              # Pipe viewer
    "python3"         # Python 3 interpreter
    "python3-pip"     # Python package manager
    "rename"          # Perl file rename script
    "ripgrep"         # Fast grep alternative
    "rsync"           # Remote synchronization tool
    "rustup"          # Rust toolchain installer
    "screen"          # Terminal multiplexer
    "socat"           # Multipurpose relay
    "sqlite3"         # Lightweight database
    "tmux"            # Terminal multiplexer
    "traceroute"      # Network diagnostic tool
    "tree"            # Directory structure viewer
    "unzip"           # Decompression utility
    "vim"             # Text editor
    "wget"            # Network downloader
    "whois"           # Domain lookup tool
    "zip"             # Compression utility
    "zopfli"          # Compression algorithm
)

# Install each application in the list
echo "Installing applications..."
for app in "${APPS[@]}"; do
  echo "Installing $app..."
  sudo apt install -y "$app"
done

echo "Cleaning up..."
sudo apt autoremove -y
sudo apt autoclean

# Installation summary
echo "Installation complete! The following applications were installed:"
printf '%s\n' "${APPS[@]}"
