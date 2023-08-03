#!/usr/bin/env bash

if [ "$(uname -s)" != "Darwin" ]; then
	echo "Not on macOS, skipping..."
	exit 1
fi

# Install Homebrew and packages
command -v "brew" >/dev/null; or curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
brew bundle check; brew bundle install

# Add SSH key to keychain
ssh_key_path="$HOME/.ssh/id_ed25519"
test -f "$ssh_key_path"; and ssh-add "$ssh_key_path"

# Set macOS user defaults
chflags nohidden ~/Library                                                                  # Show the ~/Library folder
sudo launchctl bootout /System/Library/LaunchAgents/com.apple.ReportCrash.plist &>/dev/null # Disable crash reporter
defaults write -globalDomain AppleKeyboardUIMode -int 3                                     # Enable full keyboard access for all controls
defaults write -globalDomain NSAutomaticQuoteSubstitutionEnabled -bool false                # Disable smart quotes
defaults write -globalDomain NSNavPanelExpandedStateForSaveMode -bool true                  # Expand save panel by default
defaults write -globalDomain PMPrintingExpandedStateForPrint2 -bool true                    # Expand print panel by default
defaults write com.apple.appleseed.FeedbackAssistant Autogather -bool false                 # Do not autogather large files when submitting feedback
defaults write com.apple.dock magnification -bool false                                     # Disable Dock magnification
defaults write com.apple.dock show-recents -bool false                                      # Disable recent apps in Dock
defaults write com.apple.Dock tilesize -int 48                                              # Set Dock icon size
defaults write com.apple.finder _FXSortFoldersFirst -bool true                              # Keep folders on top when sorting by name
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false                  # Disable warning when changing file extension
defaults write com.apple.finder NewWindowTargetPath "file://$HOME/Downloads"                # Set default Finder location
defaults write com.apple.finder QuitMenuItem -bool true                                     # Show Quit Finder menu item
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false                 # Hide external disks on desktop
defaults write com.apple.finder ShowPathbar -bool true                                      # Show Finder path bar
defaults write com.apple.helpviewer HVIncludesKBSearches -bool false                        # Remove Apple KB articles from Help menu
defaults write com.apple.LaunchServices LSQuarantine -bool false                            # Disable "Are you sure you want to open this application?" dialog
defaults write com.apple.Safari HomePage -string "about:blank"                              # Set Safari homepage to about:blank
defaults write com.apple.Safari IncludeDebugMenu -boolean true                              # Enable Safari debug menu
defaults write com.apple.safari ShowFullURLInSmartSearchField -bool true                    # Show full URL in Safari
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true        # Enable Safari developer tools
defaults write com.apple.screencapture disable-shadow -bool true                            # Disable screenshot shadow
defaults write com.apple.screencapture include-date -bool false                             # Exclude screenshot date
defaults write com.apple.screencapture location ~/Downloads                                 # Set screenshot location
defaults write com.apple.screencapture show-thumbnail -bool false                           # Disable screenshot thumbnail
defaults write com.apple.TextEdit RichText -bool false                                      # Use plain text mode for new TextEdit documents
defaults write com.apple.universalaccess showWindowTitlebarIcons -bool true                 # Show icons in window title bars
defaults write NSGlobalDomain AppleShowAllExtensions -bool true                             # Show file extensions
