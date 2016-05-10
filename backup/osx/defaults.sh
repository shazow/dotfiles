#!/bin/sh

# Disable dashboard
defaults write com.apple.dashboard mcx-disabled -boolean YES
killall Dock

# disable photo agent
defaults write com.apple.ImageCapture disableHotPlug -bool YES
