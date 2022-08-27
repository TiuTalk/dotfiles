#!/usr/bin/env bash

# Initialize asdf
[[ -r "/opt/asdf-vm/asdf.sh" ]] && source /opt/asdf-vm/asdf.sh

# Add plugins
asdf plugin add ruby
asdf plugin add nodejs

# Install latest ruby & set it as global
asdf install ruby latest
asdf global ruby latest

# Install latest ruby & set it as global
asdf install nodejs lts
asdf global nodejs lts


