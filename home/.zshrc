###############################################################################
# .zshrc
#
# Original generated by oh-my-zsh, now modified.
#
# zsh startup sequence:
#
# .zshenv
# .zprofile
# >> .zshrc
# .zlogin
# .zlogout
#
# http://zsh.sourceforge.net/Intro/intro_3.html
# http://wp.me/p1JkE-6S (shreevatsa.wordpress.com)
###############################################################################

###############################################################################
# Verbose Init
###############################################################################

. "${HOME}/.shared_verbose_init"
__verbose_init printf "Loading .zshrc\n"

###############################################################################
# oh-my-zsh
#
# Oh My Zsh is an open source, community-driven framework for managing your
# zsh configuration.
#
# http://ohmyz.sh/
# https://github.com/robbyrussell/oh-my-zsh
###############################################################################

# Modify $fpath for Homebrew.
###############################################################################

# _modify_fpath()
#
# Usage:
#   _modify_fpath
#
# Description:
#   If /usr/local/share/zsh/site-functions exists, remove it from `$fpath` if
#   the owner has a different name than the current user.
#
#   This directory contains homebrew-installed completions, but because they
#   are installed with a non-root user account, any user other than the
#   user who installed the formulas will encounter warnings from `compaudit`
#   and `compinit`. At this time there doesn't appear to be a good solution
#   since homebrew's non-root philosophy conflicts with `compaudit`'s
#   expectations.
_modify_fpath() {
  local _site_functions_path
  local _site_functions_owner
  local _current_user

  site_functions_path="/usr/local/share/zsh/site-functions"

  if [[ -e "${_site_functions_path}" ]]
  then
    _site_functions_owner="$(ls -ld "${_site_functions_path}" | awk '{print $3}')"
    _current_user="$(whoami)"

    if [[ "${_site_functions_owner}" != "${_current_user}" ]]
    then
      fpath=( "${fpath[@]/$_site_functions_path}" )
    fi
  fi
}
_modify_fpath

# oh-my-zsh configuration.
###############################################################################

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

ZSH_THEME="astral" # find in .oh-my-zsh.custom/themes
#ZSH_THEME="nebirhos"
#ZSH_THEME="robbyrussell"
#ZSH_THEME="ys"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
ZSH_CUSTOM="${HOME}/.oh-my-zsh.custom"

# Which plugins would you like to load? (plugins can be found in
# ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  battery
  change-extension
  colored-man-pages
  colorize
  docker
  emoji-clock
  git
  golang
  npm
  nyan
  tmuxinator
  vi-mode
  wd
 )

source "${ZSH}/oh-my-zsh.sh"

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

###############################################################################
# .shared_rc
###############################################################################

# Load .shared_rc if present.
#
# This is loaded after oh-my-zsh since some things are intended to override
# the oh-my-zsh settings.
if [[ -f "${HOME}/.shared_rc" ]]
then
  source "${HOME}/.shared_rc"
fi

###############################################################################
# .zshrc.d
###############################################################################

# Source everything in .zshrc.d if it's present.
if [[ -d "${HOME}/.zshrc.d" ]]
then
  source_dir "${HOME}/.zshrc.d"
fi

###############################################################################
# Local config
###############################################################################

# Load local config if present
if [[ -f "${HOME}/.zshrc.local" ]]
then
  source "${HOME}/.zshrc.local"
fi
