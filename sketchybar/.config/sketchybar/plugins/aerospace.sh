#!/usr/bin/env bash
source "$HOME/.config/sketchybar/colors.sh"

# make sure it's executable with:
# chmod +x ~/.config/sketchybar/plugins/aerospace.sh

# If FOCUSED_WORKSPACE is not set (e.g. on sketchybar startup), fetch it from aerospace
after-startup-command = ['exec-and-forget sketchybar']

# Notify Sketchybar about workspace change
exec-on-workspace-change = ['/bin/bash', '-c',
    'sketchybar --trigger aerospace_workspace_change FOCUSED_WORKSPACE=$AEROSPACE_FOCUSED_WORKSPACE'
]

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME background.drawing=on label.color=$YELLOW icon.color=$YELLOW
else
    sketchybar --set $NAME background.drawing=off label.color=$WHITE icon.color=$WHITE
fi
