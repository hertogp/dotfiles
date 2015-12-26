# see https://zuttobenkyou.wordpress.com/2011/08/24/xorg-using-the-us-international-altgr-intl-variant-keyboard-layout/
# see http://lists.x.org/archives/xorg/2007-July/026534.html
#
# - cmd is good, but ~/.xinitrc is not read/used?
setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl

