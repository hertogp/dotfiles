## linkify

Thanks to https://github.com/Gee-Bee/dotfiles.git

## new machine

Put together to get some consistency across various machines running XUbuntu.

```bash
sudo apt-get install exuberant-ctags
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/hertogp/dotfiles.git ~/dotfiles
cd ~/dotfiles          # linkify uses the dir it is run from
./linkify
cd
vim -c PluginInstall
```


