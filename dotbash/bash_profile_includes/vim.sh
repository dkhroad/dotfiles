OS=`uname`
if [ $OS = 'Darwin' ]; then
  alias vim="nvim"
  alias vi="nvim"
  export EDITOR=nvim

  if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
    export VISUAL="nvr --cc split --remote-wait +'set bufhidden=wipe'"
  else 
    export VISUAL=nvim
  fi
else
  export TERM="xterm-256color"
  export EDITOR=vim
fi

