#!/bin/bash

# Get numbers of workspaces in use:
WORKSPACES=$( i3-msg -t get_workspaces | tr , '\n' | grep '"num":' | sed s/^.*'"num":'/x/ | perl -p -e 's/\n/x /' )

# Set $NEW to the number of first unused workspace:
NEW=1  # starting workspace number
while [[ $( echo "$WORKSPACES" | grep "x${NEW}x" ) ]]
do
	NEW=$(( $NEW + 1 ))
done

# Move container to a new workspace and switch to that workspace OR just switch to a new workspace:
if [[ $1 == "move" ]]
then
	i3-msg move container to workspace number $NEW
fi
i3-msg workspace number $NEW
