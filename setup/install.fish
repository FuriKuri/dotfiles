#!/usr/bin/env fish

set -Ux DOTFILES ~/.dotfiles

for f in $DOTFILES/*/functions
	if not contains $f $fish_function_path
		set -Up fish_function_path $f
	end
end