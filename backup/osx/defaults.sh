#!/bin/sh

# Disable dashboard
defaults write com.apple.dashboard mcx-disabled -boolean YES
killall Dock
