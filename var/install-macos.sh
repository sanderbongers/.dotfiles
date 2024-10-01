#!/usr/bin/env bash

if [[ "$1" != "darwin" ]]; then
	echo "Not on macOS, skipping..."
	exit 1
fi


# Install Homebrew and packages
command -v "brew" >/dev/null || curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
brewfile="$HOME/.dotfiles/homebrew/.config/homebrew/Brewfile"
brew_prefix=$(brew --prefix)
"$brew_prefix"/bin/brew bundle check --file "$brewfile" || "$brew_prefix"/bin/brew bundle install --file "$brewfile"

# Delete default fish configuration
[ -d "$HOME/.config/fish" ] && rm -rf "$HOME/.config/fish"

# Create symlinks
# shellcheck disable=SC2035
"$brew_prefix"/bin/stow --target "$HOME" */

# Install fzf useful key bindings and fuzzy completion
"$brew_prefix"/opt/fzf/install

# Install copilot.nvim
if [ ! -d "$HOME/.config/nvim/pack/github/start" ]; then
	git clone https://github.com/github/copilot.vim.git ~/.config/nvim/pack/github/start/copilot.vim
fi

# Set macOS user defaults
defaults -currentHost write -g com.apple.mouse.tapBehavior -bool true
defaults write -g AppleKeyboardUIMode -int 3
defaults write -g AppleShowAllExtensions -bool true
defaults write -g InitialKeyRepeat -int 25
defaults write -g com.apple.trackpad.scaling -float 1.5
defaults write -g KeyRepeat -int 2
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true
defaults write -g PMPrintingExpandedStateForPrint2 -bool true
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.appleseed.FeedbackAssistant Autogather -bool false
defaults write com.apple.dock autohide -bool false
defaults write com.apple.dock autohide-delay -float 0.2
defaults write com.apple.dock autohide-time-modifier -float 0.33
defaults write com.apple.dock magnification -bool false
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock size-immutable -bool true
defaults write com.apple.dock tilesize -int 48
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.finder _FXSortFoldersFirst -bool true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder FXRemoveOldTrashItems -bool true
defaults write com.apple.finder NewWindowTargetPath "file://$HOME/Downloads"
defaults write com.apple.finder QuitMenuItem -bool true
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder WarnOnEmptyTrash -bool false
defaults write com.apple.helpviewer HVIncludesKBSearches -bool false
defaults write com.apple.LaunchServices LSQuarantine -bool false
defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.screencapture include-date -bool false
defaults write com.apple.screencapture location "$HOME/Downloads"
defaults write com.apple.screencapture show-thumbnail -bool false
defaults write com.apple.TextEdit RichText -bool false
killall Dock
killall Finder
chflags nohidden ~/Library
sudo pmset -a displaysleep 60 ttyskeepawake 1

# Remap Right Option to (broken) Left Control key
hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x7000000E6,"HIDKeyboardModifierMappingDst":0x7000000E0}]}'
