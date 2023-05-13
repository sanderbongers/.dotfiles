all:
	stow --verbose --restow --target ~ */
simulate:
	stow --verbose --restow --target ~ --simulate */
clean:
	stow --verbose --target ~ --delete */
