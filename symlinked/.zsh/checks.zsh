# Perform some checks & set corresponding flags.
[[ $(uname) = Linux ]] && IS_LINUX=1
[[ $(uname) = Darwin ]] && IS_MAC=1
[[ -x `which brew` ]] && HAS_BREW=1
[[ -x `which apt-get` ]] && HAS_APT=1
[[ -x `which yum` ]] && HAS_YUM=1
