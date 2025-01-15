# Dotfiles

## Description

This repository contains my personal configuration files (dotfiles) for macOS and Linux. These dotfiles help to set up a consistent development environment across different machines. You can use these dotfiles as a starting point for your own configuration. Please check the files and modify them as needed before running the installation script.

### **Do not execute the installation script without understanding what it does! No seriously, just don't!**

## Installation

To install the dotfiles, follow these steps:

1. Fork the repository to your GitHub account.

2. Clone the repository:
    ```sh
    git clone https://github.com/yourusername/dotfiles.git
    cd dotfiles
    ```

3. Run the installation script:
    ```sh
    ./setup.sh
    ```

## Symlinks

If you only want to create symlinks, you can run the following script:

```sh
./symlink.sh
```

## Removal

You can run unset.sh to remove the created symlinks in your home directory.

```sh
./unset.sh
```

## Features

- **Bash**: Custom bash prompt, aliases, and functions.
- **Git**: Global git configuration and aliases.
- **Vim**: Vim configuration with plugins.
- **Tmux**: Tmux configuration with plugins.
- **macOS**: System preferences and applications.
- **Brewfile**: List of applications to install with Homebrew.

## Extra

For custom configurations, you can create a `.extra` file in your home directory. This file will be sourced by the `.bashrc` file.

```sh
touch ~/.extra
```

A sample `.extra` file:

```sh
# .gitconfig
GIT_AUTHOR_NAME='John Doe'
export GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL='john.doe@example.com'
export GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
GH_USER='john-doe'
git config --global github.user "$GH_USER"
```

## Usage

After installation, the configuration files will be symlinked to your home directory.

## Contributing

Feel free to submit issues or pull requests if you have any improvements or suggestions.

## License

This project is licensed under the MIT License.
