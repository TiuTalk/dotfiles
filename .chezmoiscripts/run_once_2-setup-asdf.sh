#!/usr/bin/env bash

# Initialize asdf
[[ -r "/opt/asdf-vm/asdf.sh" ]] && source /opt/asdf-vm/asdf.sh

# Install latest ruby & set it as global
asdf plugin add ruby
asdf install ruby latest
asdf global ruby latest

# Install latest ruby & set it as global
asdf plugin add nodejs
asdf install nodejs lts
asdf global nodejs lts

# Install latest python
asdf plugin add ptyhon
asdf install python 3.10.6 2.7.18
asdf global python 3.10.6 2.7.18
