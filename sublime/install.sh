#!/bin/bash

# Get the destination directory
destination_dir="$HOME/Library/Application Support/Sublime Text/Packages/User"

# Create the symlink
cp "Default (OSX).sublime-keymap" "$destination_dir/Default (OSX).sublime-keymap"
cp "Package Control.sublime-settings" "$destination_dir/Package Control.sublime-settings"
cp "Preferences.sublime-settings" "$destination_dir/Preferences.sublime-settings"
