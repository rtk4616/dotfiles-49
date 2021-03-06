#!/usr/bin/env bash
###############################################################################
# provision.bash
#
# Initialize dotfiles.
#
# To use with Vagrant, add the following to a Vagrantfile:
#
# dotfiles_url = "https://raw.githubusercontent.com/alphabetum/dotfiles/master"
# config.vm.provision "shell",
#                     path: "#{dotfiles_url}/boxes/scripts/provision.bash",
#                     privileged: false
###############################################################################

# Only clone if ~/.bindle doesn't exist.
#
# This makes it possible to run this script multiple times without exiting
# due to a failed clone.
if [[ ! -e "${HOME}/.bindle" ]]
then
  git clone https://github.com/alphabetum/dotfiles.git "$HOME/.bindle"
fi

"$HOME/.bindle/script/bootstrap/linux"
