#!/usr/bin/env bash

# make sure it's executable with:
# chmod +x ~/.config/sketchybar/plugins/aerospace.sh


sketchybar --add event aerospace_workspace_change

spaces=()

for sid in $(aerospace list-workspaces --all); do

    # Set default values
    label="$sid"
    icon=''  # Default icon (you can change this)

    # Customize label and icon based on $sid
    case $sid in
        1)
            label="1.Todo"
            icon=􂿲 # Or use SF Symbols like "􀎞" for a house icon
            ;;
        2)
            label="2.Notes"
            icon="􀫖"  
            ;;
        3)
            label="3.Code"
            icon="􁈸"  
            ;;
		4)
            label="4.CLI"
            icon="􀩼" 
            ;;
        5)
            label="5.Web"
            icon="􁇲"  
            ;;
        6)
            label="6.Figma"
            icon="􁾛" 
            ;;
        
        *)
            # Keep defaults for any unmatched $sid
            ;;
    esac

    space=(
		# label.background.color=$BACKGROUND_2
		# label.background.corner_radius=6
        label.color=$WHITE
        label.background.height=26 
        background.drawing=off
        # label="$sid"
        # icon=􃁯
        label="$label"  # Use the customized label
        icon="$icon"    # Use the customized icon
        icon.color=$WHITE
        label.padding_left=2
		label.padding_right=8
     	padding_left=2
	 	padding_right=2
        click_script="aerospace workspace $sid"
        script="$PLUGIN_DIR/aerospace.sh $sid"
	)

    sketchybar --add item space.$sid left \
        --subscribe space.$sid aerospace_workspace_change \
        --set space.$sid "${space[@]}" \
    
done



spaces=(
	background.color=$BACKGROUND_1
	background.border_color=$BACKGROUND_2
	background.border_width=2
	background.drawing=on
)

separator=(
	icon=􀆂
	icon.font="$FONT:ExtraBold:16.0"
	padding_left=10
	padding_right=10
	label.drawing=off
	associated_display=active
	icon.color=$WHITE
)

sketchybar --add bracket spaces '/space\..*/' \
	--set spaces "${spaces[@]}" \
	\
	--add item separator left \
	--set separator "${separator[@]}"