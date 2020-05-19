#!/bin/sh

# The following line is mainly so you can have the correct apostrophe handy, since it is 
# not ASCII.

# You can edit this line if you just want a default.
DEFAULT_HEADPHONES="User’s AirPods Pro"   

# Or pass it as a command-line parameter (this takes precedence)
if [ -n "$1" ]; then HEADPHONES="$1"; fi

# Or define the name of your headphones in your environment, 
# like
# export HEADPHONES=AirPods
# or pass it as a variable like:
# HEADPHONES=AirPods bt-headphones
if [ -z "$HEADPHONES" ]; then HEADPHONES=$DEFAULT_HEADPHONES; fi

osascript <<EOF
set headphones to "$HEADPHONES"
activate application "SystemUIServer"
tell application "System Events"
	tell process "SystemUIServer"
		set btMenu to (menu bar item 1 of menu bar 1 where description is "bluetooth")
		tell btMenu
			click
			tell (menu item headphones of menu 1)
				click
				if exists menu item "Connect" of menu 1 then
					click menu item "Connect" of menu 1
					return "Connecting..."
				else
					click btMenu -- Close main BT drop down if Connect wasn't present
					return "Connect menu was not found, are you already connected?"
				end if
			end tell
		end tell
	end tell
end tell
EOF

