#!/usr/bin/env bash

# Install packages
yay -S --needed neovim alacritty ripgrep asdf-vm starship

# Change shell
[[ "$SHELL" != "$(which zsh)" ]] && chsh -s $(which zsh)

true