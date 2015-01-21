#!/usr/bin/env bash

# osx_apps.sh
#
# Configure and set various preferences for non-default OS X applications,
# including developer and third-party applications.

###############################################################################
# Platform Check
###############################################################################

if [[ ! "$OSTYPE" =~ ^darwin ]]; then
  printf "osx_apps.sh is only supported on OS X.\nSkipping...\n"
  exit 0
fi

###############################################################################
# Xcode Developer Applications
###############################################################################

# Add iOS Simulator to Launchpad and Spotlight
# Notes: spotlight apparently doesn't index symlinks properly, so an alias is
# required in order to get it picked up properly.
make_alias "/Applications/Xcode.app/Contents/Developer/Applications/iOS Simulator.app" "/Applications"


###############################################################################
# iTerm2
###############################################################################

# Set hidden AlternateMouseScroll preference for better scrolling in command
# line programs.
# More information:
# - https://filippo.io/native-scrolling-and-iterm2/
# - https://code.google.com/p/iterm2/issues/detail?id=2311
# - http://stackoverflow.com/questions/14437979/iterm2-scroll-less-output-with-mouse
# Revert command:
# defaults delete com.googlecode.iterm2 AlternateMouseScroll
defaults write com.googlecode.iterm2 AlternateMouseScroll -bool true


