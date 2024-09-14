# Download and install the Monaco Nerd font, if it's not already installed
if test "$os" = "darwin" && not test -e ~/Library/Fonts/MonacoNerdFont-Regular.ttf
    curl -fLO https://github.com/thep0y/monaco-nerd-font/releases/download/v0.2.1/MonacoNerdFont.zip
    unzip -o MonacoNerdFont.zip -d ~/Library/Fonts
    rm MonacoNerdFont.zip
end
