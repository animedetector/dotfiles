#!/usr/bin/env zsh

sketchybar --set "$NAME" icon.highlight="$SELECTED"

if [[ "$SELECTED" == "true" ]]; then
	sketchybar --set "$NAME" background.color=0xFFBB9AF7
else
	sketchybar --set "$NAME" background.color=0xFF24283B
fi
