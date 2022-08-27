#!/usr/bin/env bash

# Install packages
yay -S --needed neovim alacritty tmux ripgrep asdf-vm starship antibody-bin z diff-so-fancy

# Change shell
[[ "$SHELL" != "$(which zsh)" ]] && chsh -s $(which zsh)

true
