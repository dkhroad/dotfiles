OS=`uname`
if [ $OS = 'Darwin' ]; then
  alias  vims="vim --servername FOOBAR"
  alias vimc="vim --servername FOOBAR --remote"
  alias vi="vim"
else
  alias  vims="vim --servername FOOBAR"
  alias vimc="vim --servername FOOBAR --remote"
  export TERM="xterm-256color"
fi

alias vim="nvim"
alias vi="nvim"
export EDITOR=nvim

if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
  export VISUAL="nvr --cc split --remote-wait +'set bufhidden=wipe'"
else 
  export VISUAL=nvim
fi
