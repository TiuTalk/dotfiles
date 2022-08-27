#!/usr/bin/env bash

# Install packages
yay -S --needed neovim alacritty ripgrep asdf-vm starship antibody

# Change shell
[[ "$SHELL" != "$(which zsh)" ]] && chsh -s $(which zsh)

true
