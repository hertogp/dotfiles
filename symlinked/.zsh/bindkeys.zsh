# To see the key combo you want to use just do:
# cat > /dev/null
# And press it

#bindkey "^K"      kill-whole-line                      # ctrl-k
bindkey "^R"      history-incremental-search-backward  # ctrl-r
bindkey "^A"      beginning-of-line                    # ctrl-a
bindkey "^E"      end-of-line                          # ctrl-e
bindkey "[B"      history-search-forward               # down arrow
bindkey "[A"      history-search-backward              # up arrow
bindkey "^D"      delete-char                          # ctrl-d
bindkey "^F"      forward-char                         # ctrl-f
bindkey "^B"      backward-char                        # ctrl-b
bindkey -v   # Default to standard vi bindings, regardless of editor string

# map caps to control
# - alternative: setxkbmap -option 'ctrl:nocaps'
# xmodmap ~/.xmodmaprc
# - show current keyboard options: setxkbmap -query
setxkbmap -option 'ctrl:nocaps'

# Use US keyboard layout, variant ALTGR-INTL
# - right-alt key to get éÉ-characters².
# - not sure if bashrc is the best place to do this
# - see https://wiki.archlinux.org/index.php/Keyboard_configuration_in_Xorg
# - couldn't find anything in /etc/X11
# - see /etc/default/keyboard
setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl
