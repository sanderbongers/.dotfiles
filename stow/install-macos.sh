#!/usr/bin/env bash

if [ "$(uname -s)" != "Darwin" ]; then
	echo "Not on macOS, skipping..."
	exit 1
fi

brew_prefix=$(brew --prefix)

# Install Homebrew and packages
command -v "brew" >/dev/null || curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
brewfile="$HOME/.dotfiles/homebrew/.config/homebrew/Brewfile"
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

# Store SSH key passphrase in keychain
ssh_key_path="$HOME/.ssh/id_ed25519"
test -f "$ssh_key_path" && /usr/bin/ssh-add --apple-use-keychain "$ssh_key_path"

# Set macOS user defaults
# chflags nohidden ~/Library                                                           # Show the ~/Library folder
# defaults write -globalDomain AppleKeyboardUIMode -int 3                              # Enable full keyboard access for all controls
# defaults write -globalDomain NSAutomaticQuoteSubstitutionEnabled -bool false         # Disable smart quotes
# defaults write -globalDomain NSNavPanelExpandedStateForSaveMode -bool true           # Expand save panel by default
# defaults write -globalDomain PMPrintingExpandedStateForPrint2 -bool true             # Expand print panel by default
# defaults write com.apple.appleseed.FeedbackAssistant Autogather -bool false          # Do not autogather large files when submitting feedback
# defaults write com.apple.dock magnification -bool false                              # Disable Dock magnification
# defaults write com.apple.dock show-recents -bool false                               # Disable recent apps in Dock
# defaults write com.apple.dock autohide -bool true                                    # Auto-hide Dock
# defaults write com.apple.dock tilesize -int 48                                       # Set Dock icon size
# defaults write com.apple.finder _FXSortFoldersFirst -bool true                       # Keep folders on top when sorting by name
# defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false           # Disable warning when changing file extension
# defaults write com.apple.finder NewWindowTargetPath "file://$HOME/Downloads"         # Set default Finder location
# defaults write com.apple.finder QuitMenuItem -bool true                              # Show Quit Finder menu item
# defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false          # Hide external disks on desktop
# defaults write com.apple.finder ShowPathbar -bool true                               # Show Finder path bar
# defaults write com.apple.helpviewer HVIncludesKBSearches -bool false                 # Remove Apple KB articles from Help menu
# defaults write com.apple.LaunchServices LSQuarantine -bool false                     # Disable "Are you sure you want to open this application?" dialog
# defaults write com.apple.Safari HomePage -string "about:blank"                       # Set Safari homepage to about:blank
# defaults write com.apple.Safari IncludeDebugMenu -boolean true                       # Enable Safari debug menu
# defaults write com.apple.safari ShowFullURLInSmartSearchField -bool true             # Show full URL in Safari
# defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true # Enable Safari developer tools
# defaults write com.apple.screencapture disable-shadow -bool true                     # Disable screenshot shadow
defaults write com.apple.screencapture include-date -bool false # Exclude screenshot date
# defaults write com.apple.screencapture location ~/Downloads                          # Set screenshot location
# defaults write com.apple.screencapture show-thumbnail -bool false                    # Disable screenshot thumbnail
# defaults write com.apple.TextEdit RichText -bool false                               # Use plain text mode for new TextEdit documents
# defaults write com.apple.universalaccess showWindowTitlebarIcons -bool true          # Show icons in window title bars
# defaults write NSGlobalDomain AppleShowAllExtensions -bool true                      # Show file extensions
