set -gx HOMEBREW_BUNDLE_FILE $HOME/.config/homebrew/Brewfile
set -gx HOMEBREW_NO_ENV_HINTS 1

# Use Homebrew's Ruby gems to install gems
if command -q brew-gem
    abbr --add gem "brew gem"
end
