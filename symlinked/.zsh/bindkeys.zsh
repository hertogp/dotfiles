# Use <c-v><your-key-combo> to see what gets sent to the terminal
# Usefull commands:
# $ bindkey   #-> lists all keybindings in effect
#
# Got this from http://zshwiki.org/home/zle/emacsandvikeys
# - vicmd keys when you hit ESC or ^[ of jj, emacs-ish if you don't
# - if you need jj on the cmdline itself, type'm slowly
# - I used "<c-v><c-key>" to enter control keys below
# - HOME/DELETE/END/<-/-> seem to work out-of-the-box
# - ^w deletes word backward
# - see zsh-manual.pdf, 18.6 Default widget for more default bindings
#   in the form of <widget/action> (emacs) (vicmd) (viins)
#   where the 3 (..) denote the bindings in those keymaps.
# vi-like {{{1
bindkey -v     # Default to vi, add the following:
bindkey "jj"   ""                                 # jj to escape to vicmd
bindkey "^R"   history-incremental-search-backward  # search cmd history
bindkey "^K"   kill-whole-line
bindkey "^A"   vi-beginning-of-line
bindkey "^E"   end-of-line
bindkey "^D"   delete-char
bindkey "^F"   forward-char
bindkey "^B"   backward-char
bindkey ""   history-search-forward
bindkey "[B"   history-search-forward               # next cmd
bindkey ""   history-search-backward              # previous cmd
bindkey "[A"   history-search-backward              # previous cmd

# CAPS->CONTROL {{{1
# - show current keyboard options: setxkbmap -query
# - there are two ways to map cap->ctrl:
#   $ setxkbmap -option 'ctrl:nocaps'
#   $ xmodmap ~/.xmodmaprc
setxkbmap -option 'ctrl:nocaps'

# KEYBOARD layout {{{1
# Use US keyboard layout, variant ALTGR-INTL
# - right-alt key to get accented chars: 
#   (right-alt+e) -> é
#   (right-alt+2) -> ²
#   (right-alt+5) -> €
#   (right-alt+c) -> ©
# - not sure if this is the best place to do this
# - couldn't find anything in /etc/X11
# - see https://wiki.archlinux.org/index.php/Keyboard_configuration_in_Xorg
# - see /etc/default/keyboard
setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl
