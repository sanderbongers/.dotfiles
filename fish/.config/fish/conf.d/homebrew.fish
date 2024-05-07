set -gx HOMEBREW_BUNDLE_FILE $HOME/.config/homebrew/Brewfile
set -gx HOMEBREW_NO_ENV_HINTS 1

# Use Homebrew's Ruby to install gems
if command -sq brew-gem
    abbr --add gem "brew gem"
end
