#!/usr/bin/env bash

# Install brew if needed
if ! command -v brew &> /dev/null
then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
		eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed #--with-default-names

# Install `wget` with IRI support.
brew install wget #--with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim #--with-override-system-vi
brew install grep
#brew install openssh #breaks ssh-add

# Install font tools.

# Install other useful binaries.
brew install ack
#brew install exiv2
brew install git
brew install git-lfs
brew install npm
brew install thefuck

# Cloud
brew install --cask docker
brew install yarn
brew install helm
brew install argocd
brew install yq
brew install jq

# Dev
brew install mvn
brew install gradle
brew install git-flow
brew install diff-so-fancy
brew install --cask cheatsheet
brew install --cask macupdater
brew install --cask sublime-text

# Lifestyle
brew install --cask bitwarden
brew install --cask telegram
brew install --cask whatsapp
brew install --cask homebrew/cask-versions/transmission-nightly


# Remove outdated versions from the cellar.
brew cleanup
