#!/bin/bash

# Get numbers of workspaces in use:
WORKSPACES=$( i3-msg -t get_workspaces | tr , '\n' | grep '"num":' | sed s/^.*'"num":'// )

# Set $NEW to number of the first unused workspace:
NEW=1
while [[ $( echo "$WORKSPACES" | grep "$NEW" ) ]]
do
	NEW=$(( $NEW + 1 ))
done

# Move container to a new workspace:
if [[ $1 == "move" ]]
then
	i3-msg move container to workspace number $NEW
fi

# Switch to the new workspace:
i3-msg workspace number $NEW
