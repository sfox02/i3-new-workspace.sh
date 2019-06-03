# i3-new-workspace

Automatically create a new workspace in i3 tiling wm.

It checks for existing workspaces and creates a new one with the lowest number possible. Optionally, the focused container can be moved to the newly created workspace.

## Usage
* create a new workspace: `./i3-new-workspace.sh`
* create a new workspace and move the focused container: `./i3-new-workspace.sh move`

You probably want to add a key binding to run this script.
