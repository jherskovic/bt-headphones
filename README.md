# bt-headphones
Pair headphones with your Mac from the command line. The main use is to create a button 
that allows you to pair from the Touch Bar. It's a little involved, especially given 
the permissions you have to grant, but it's not that bad.

## Installation
1. Clone the repository to your computer. I'll assume you cloned it to `~/src/bt-headphones`

2. Make SURE that you have the right name for your headphones. If you use Apple's 
AirPods/AirPods Pro, the default name has a non-ASCII apostrophe. The default name in
the `bt-headphones.sh` file has the correct character.

3. Open Automator and create a New Document of type Quick Action. This is important,
because you can only add Quick Actions to the Touch Bar.

4. Change the input (the dropdown next to "Workflow receives current") to "No input".

5. Add an action of type "Run Shell Script". The shell type doesn't really matter.

6. Type the following into the box:
```
sh ~/src/bt-headphones/bt-headphones.sh "THE NAME OF THE HEADPHONES FROM THE BLUETOOTH MENU"
```

7. Run it. You'll get a request for permission saying that Automator wants to control
your computer using accessibility features, and the script will fail immediately. Grant 
the permission, and run the Automator action again. It should succeed.

8. Aside: Why not just write the AppleScript in Automator? Because Automator AppleScript 
is limited and not allowed to control the UI.

9. Once you're sure the action works, Export it (File->Export). The Desktop is a 
reasonable place. Give it a descriptive name.

10. Go to wherever you exported it, and double-click on it. You'll get asked if you want
to install the Quick Action. Click "Install".

11. The Quick Action will show up in system preferences, under 
Keyboard->Shortcuts->Services->General (you can of course add a keyboard shortcut to 
trigger it here!) and under Extensions. Add a keyboard shortcut if you want, and trigger 
it. You'll get ANOTHER request, this time "System Preferences" wants control of "System 
Events". Allow it. You'll also be taken to Security & Privacy->Privacy->Accessibility. 
Click the lock to allow changes, find "System Preferences" and click on the checkbox to
allow it to control your Bluetooth menu. You'll need to do this for every application in
which you want to use the shortcut. It's inconvenient.

12. What you really want is the Touch Bar button. Go to System Preferences->Extensions 
and scroll to the bottom, where Touch Bar is. The Action should already be there. Open
"Customize Control Strip" to add the Quick Actions button to your Touch Bar (it's the last
one, and you have to physically drag it _underneath the screen_ to the Touch Bar).

13. Tap the Quick Actions button and your shiny new "Connect" action on the Touch Bar. 
Grant all necessary permissions one last time. You're done.

14. If you're not insane, consider buying Better Touch Tool, which does this A LOT better.

I just went through this insane exercise because my spouse wanted a first-party solution. 
It works.


