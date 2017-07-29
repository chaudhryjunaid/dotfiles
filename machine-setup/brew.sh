#!/usr/bin/env bash

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

brew tap homebrew/bundle
brew bundle

# Remove outdated versions from the cellar.
brew cleanup


