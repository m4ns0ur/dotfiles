#!/usr/bin/env bash

# Automatically elevate privileges if not running as root
# if [ "$EUID" -ne 0 ]; then
#   echo "Re-running the script with root privileges..."
#   exec sudo "$0" "$@"
# fi

# Update and upgrade the package list
echo "Updating package list..."
apt update && apt upgrade -y

# List of common CLI applications to install
APPS=(
    "git"             # Version control system
    "git-lfs"         # Git extension for versioning large files
    "build-essential" # Essential compilation tools
    "gcc"             # GNU Compiler Collection
    "clang"           # C/C++ compiler
    "make"            # Build automation tool
    "autoconf"        # Automatic configure script builder
    "automake"        # Tool for generating GNU Standards-compliant Makefiles
    "gettext"         # GNU internationalization library
    "libtool"         # Generic library support script
    "pkg-config"      # Package config system
    "nodejs"          # JavaScript runtime
    "npm"             # Node.js package manager
    "imagemagick"     # Image manipulation tool
    "golang"          # Go programming language
    "rustup"          # Rust toolchain installer
    "neovim"          # Vim-fork focused on extensibility and usability
    "htop"            # Interactive process viewer
    "mpv"             # Media player
    "pipenv"          # Python dependency manager
    "bat"             # Cat command with syntax highlighting
    "fzf"             # Fuzzy file finder
    "rsync"           # Remote synchronization tool
    "curl"            # Command-line tool for transferring data with URLs
    "wget"            # Network downloader
    "vim"             # Text editor
    "nvim"            # Neovim text editor
    "tmux"            # Terminal multiplexer
    "jq"              # JSON processor
    "tree"            # Directory structure viewer
    "nmap"            # Network scanner
    "ripgrep"         # Fast grep alternative
    "gdb"             # Debugger
    "net-tools"       # Networking utilities
    "traceroute"      # Network diagnostic tool
    "whois"           # Domain lookup tool
    "zip"             # Compression utility
    "unzip"           # Decompression utility
    "neofetch"        # System information tool
    "bash-completion" # Bash completion
    "python3"         # Python 3 interpreter
    "python3-pip"     # Python package manager
    "sqlite3"         # Lightweight database
    "openjdk-21-jdk"  # Java Development Kit
    "coreutils"       # GNU core utilities
    "moreutils"       # Additional Unix utilities
    "findutils"       # GNU find utilities
    "diffutils"       # File comparison utilities
    "dnsutils"        # DNS utilities
    "gpg"             # GNU Privacy Guard
    "gnupg"           # GNU Privacy Guard
    "netcat-openbsd"  # TCP/IP swiss army knife
    "socat"           # Multipurpose relay
    "exiv2"           # Image metadata manipulation tool
    "lua5.4"          # Lua programming language
    "lynx"            # Text-based web browser
    "p7zip-full"      # 7z compression utility
    "p7zip-rar"       # RAR compression utility
    "pigz"            # Parallel gzip
    "pv"              # Pipe viewer
    "rename"          # Perl file rename script
    "screen"          # Terminal multiplexer
    "zopfli"          # Compression algorithm
)

# Install each application in the list
echo "Installing applications..."
for app in "${APPS[@]}"; do
  echo "Installing $app..."
  apt install -y "$app"
done

echo "Cleaning up..."
apt autoremove -y
apt autoclean

# Installation summary
echo "Installation complete! The following applications were installed:"
printf '%s\n' "${APPS[@]}"
