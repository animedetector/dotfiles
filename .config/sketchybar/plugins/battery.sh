#!/usr/bin/env zsh

PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"

if [ "$PERCENTAGE" = "" ]; then
	exit 0
fi

case "${PERCENTAGE}" in
	8[0-9]|100) ICON="􀛨"
	;;
	[6-7][0-9]) ICON="􀺸"
	;;
	[4-5][0-9]) ICON="􀺶"
	;;
	[2-3][0-9]) ICON="􀛩"
	;;
	*) ICON="􀛪"
esac

if [[ "$CHARGING" != "" ]]; then
	ICON="􀢋"
fi

sketchybar --set "$NAME" icon="$ICON" label="${PERCENTAGE}%"
