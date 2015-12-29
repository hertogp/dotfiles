autoload colors; colors

# The variables are wrapped in \%\{\%\}. This should be the case for every
# variable that does not contain space.
for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
  eval PR_$COLOR='%{$fg_no_bold[${(L)COLOR}]%}'
  eval PR_BOLD_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
done

eval RESET='$reset_color'
export PR_RED PR_GREEN PR_YELLOW PR_BLUE PR_WHITE PR_BLACK
export PR_BOLD_RED PR_BOLD_GREEN PR_BOLD_YELLOW PR_BOLD_BLUE 
export PR_BOLD_WHITE PR_BOLD_BLACK

# Clear LS_COLORS
unset LS_COLORS
export CLICOLOR=1
# Main change, you can see directories on a dark background
#export LS_COLORS=gxfxcxdxbxegedabagacad
#export LS_COLORS=exfxcxdxbxegedabagacad
# See also:
# - http://www.bigsoft.co.uk/blog/index.php/2008/04/11/configuring-ls_colors
# - LS_COLORS=<key=colorcode;colorcode;..>:<key=effect>: ..
# - keys include:
#   no normal, fi file, di dir, ln link, st sticky, ex executable ... etc
# - color codes:
#   effects:    00 default, 01 bold, 04 underline, 05 flash, 07 reversed, 08
#   fg-colors : 30 black, 31 red, 32 green, 33 orange, 34 blue, 35 purple, 36 cyan, 37 grey
#   bg-colors : 40 black, 41 red, 42 green, 43 orange, 44 blue, 45 purple, 46 cyan, 47 grey
#   extra fg-col: 90 darkgrey, 91 lightred, 92 lightgreen, 93 yellow, 94 lightblue, 95 light purple
#                 96 turquoise, 97 white
#   extra bg-col: bg-color+10 (except for white), so 102 is lighgreen background
#
export LS_COLORS="di=00;94:ln=00;95:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=00;32";
