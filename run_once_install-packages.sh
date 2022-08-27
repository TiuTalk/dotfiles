#!/usr/bin/env bash

{{- $reflector = promptBool "Update Pacman mirror list?" -}}

# Update pacman mirrorlist
[[ {{$reflector}} ]] && reflector --verbose -c BR -c CL -c PY -c US --protocol https --sort rate --latest 10 --download-timeout 5

# Install packages
yay -S --needed neovim alacritty ripgrep asdf-vm starship antibody-bin

# Change shell
[[ "$SHELL" != "$(which zsh)" ]] && chsh -s $(which zsh)

true
