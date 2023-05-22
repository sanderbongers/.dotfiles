# https://www.passwordstore.org/

set -gx PASSWORD_STORE_CHARACTER_SET a-zA-Z0-9
set -gx PASSWORD_STORE_ENABLE_EXTENSIONS true
set -gx PASSWORD_STORE_EXTENSIONS_DIR /usr/local/lib/python3.11/site-packages/usr/lib/password-store/extensions
set -gx PASSWORD_STORE_GENERATED_LENGTH 20
