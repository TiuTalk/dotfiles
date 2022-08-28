#!/usr/bin/env bash

PACMAN_PACKAGES=(
  alacritty
  tmux
  neovim
  ripgrep
  starship
  z
  diff-so-fancy
  ttf-fira-code
  postgresql-libs
  xclip
)

AUR_PACKAGES=(
  antibody-bin
  asdf-vm
  nerd-fonts-fira-code
)

INSTALLED=$(pacman -Qqme)
TO_INSTALL=()

for package in ${AUR_PACKAGES[@]}; do
  [[ "$INSTALLED" =~ "$package" ]] || TO_INSTALL+=($package)
done

# Install yay packages
yay -S --needed "${PACMAN_PACKAGES[@]}"
[ ${#TO_INSTALL[@]} -eq 0 ] && yay -S "${TO_INSTALL[@]}"

# Intsall tmux scripts
~/.tmux/plugins/tpm/bin/install_plugins

# Change shell
[[ "$SHELL" != "$(which zsh)" ]] && chsh -s $(which zsh)

true
