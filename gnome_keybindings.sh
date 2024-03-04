#!/bin/bash
echo overriding keybings
gsettings set "org.gnome.desktop.wm.keybindings" "move-to-workspace-1" "['<Super><Shift>1']"
gsettings set "org.gnome.desktop.wm.keybindings" "move-to-workspace-2" "['<Super><Shift>2']"
gsettings set "org.gnome.desktop.wm.keybindings" "move-to-workspace-3" "['<Super><Shift>3']"
gsettings set "org.gnome.desktop.wm.keybindings" "move-to-workspace-4" "['<Super><Shift>4']"
gsettings set "org.gnome.desktop.wm.keybindings" "move-to-workspace-5" "['<Super><Shift>5']"
gsettings set "org.gnome.desktop.wm.keybindings" "move-to-workspace-6" "['<Super><Shift>6']"
gsettings set "org.gnome.desktop.wm.keybindings" "move-to-workspace-7" "['<Super><Shift>7']"
gsettings set "org.gnome.desktop.wm.keybindings" "move-to-workspace-8" "['<Super><Shift>8']"
gsettings set "org.gnome.desktop.wm.keybindings" "move-to-workspace-9" "['<Super><Shift>9']"
gsettings set "org.gnome.desktop.wm.keybindings" "move-to-workspace-10" "['<Super><Shift>0']"

gsettings set "org.gnome.desktop.wm.keybindings" "switch-to-workspace-down" "['<Control><Alt>Down', '<Super>j']"
gsettings set "org.gnome.desktop.wm.keybindings" "switch-to-workspace-left" "['<Super>Page_Up', '<Super><Alt>Left', '<Control><Alt>Left', '<Super>h']"
gsettings set "org.gnome.desktop.wm.keybindings" "switch-to-workspace-right" "['<Super>Page_Down', '<Super><Alt>Right', '<Control><Alt>Right', '<Super>l']"
gsettings set "org.gnome.desktop.wm.keybindings" "switch-to-workspace-up" "['<Control><Alt>Up', '<Super>k']"

gsettings set "org.gnome.desktop.wm.keybindings" "toggle-fullscreen" "['<Alt>F11']"

gsettings set "org.gnome.desktop.wm.keybindings" "switch-to-workspace-1" "['<Alt>1']" 
gsettings set "org.gnome.desktop.wm.keybindings" "switch-to-workspace-2" "['<Alt>2']" 
gsettings set "org.gnome.desktop.wm.keybindings" "switch-to-workspace-3" "['<Alt>3']" 
gsettings set "org.gnome.desktop.wm.keybindings" "switch-to-workspace-4" "['<Alt>4']" 
gsettings set "org.gnome.desktop.wm.keybindings" "switch-to-workspace-5" "['<Alt>5']" 
gsettings set "org.gnome.desktop.wm.keybindings" "switch-to-workspace-6" "['<Alt>6']" 
gsettings set "org.gnome.desktop.wm.keybindings" "switch-to-workspace-7" "['<Alt>7']" 
gsettings set "org.gnome.desktop.wm.keybindings" "switch-to-workspace-8" "['<Alt>8']" 
gsettings set "org.gnome.desktop.wm.keybindings" "switch-to-workspace-9" "['<Alt>9']" 
gsettings set "org.gnome.desktop.wm.keybindings" "switch-to-workspace-10" "['<Alt>0']" 

gsettings set "org.gnome.shell.keybindings" "switch-to-application-1" "['<Super>1']"
gsettings set "org.gnome.shell.keybindings" "switch-to-application-2" "['<Super>2']"
gsettings set "org.gnome.shell.keybindings" "switch-to-application-3" "['<Super>3']"
gsettings set "org.gnome.shell.keybindings" "switch-to-application-4" "['<Super>4']"
gsettings set "org.gnome.shell.keybindings" "switch-to-application-5" "['<Super>5']"
gsettings set "org.gnome.shell.keybindings" "switch-to-application-6" "['<Super>6']"
gsettings set "org.gnome.shell.keybindings" "switch-to-application-7" "['<Super>7']"
gsettings set "org.gnome.shell.keybindings" "switch-to-application-8" "['<Super>8']"
gsettings set "org.gnome.shell.keybindings" "switch-to-application-9" "['<Super>9']"
gsettings set org.gnome.desktop.interface enable-animations false
