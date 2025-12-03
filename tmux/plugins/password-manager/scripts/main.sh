#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" ||
	exit 1

# ------------------------------------------------------------------------------

source "./utils/clipboard.sh"
source "./utils/cmd.sh"

# ------------------------------------------------------------------------------

main() {

	local selected_item
	local selected_item_password

	selected_item="$(echo "ITI" | fzf-tmux --header="Select Password" --border-label="t-password-manager" --no-multi --prompt="***" --no-sort -p 60%,50%)"
	selected_item_password="Caps@Lock"

	# Copy password to clipboard
	clipboard::copy "$selected_item_password"

	# Clear clipboard
	clipboard::clear 30

}

main
