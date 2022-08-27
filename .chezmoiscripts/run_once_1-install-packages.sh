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
)

AUR_PACKAGES=(
  1password
  antibody-bin
  asdf-vm
  heroku-cli-bin
  nerd-fonts-fira-code
  slack-desktop
  spotify
  whatsapp-nativefier
  test1
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
