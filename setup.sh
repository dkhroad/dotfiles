ln -s  `pwd`/dotgitconfig ~/.gitconfig
ln -s  `pwd`/dotgithelpers ~/.githelpers
ln -s  `pwd`/dotvim/gvimrc ~/.gvimrc
ln -s  `pwd`/dotvim/vimrc ~/.vimrc
ln -s  `pwd`/dotvim/vimrc ~/.vim
ln -s  `pwd`/dotirb/irbc  ~/.irbrc
ln -s  `pwd`/dotzsh/dotzshrc ~/.zshrc # you will also need to clone oh-my-zsh repo
ln -s  `pwd`/dotbash/bash_profile_includes ~/.bash_profile_includes
if [[ ! -e ~/.oh-my-zsh ]]; then
  echo git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
else
  echo ".oh-my-zsh is already cloned.."
fi
