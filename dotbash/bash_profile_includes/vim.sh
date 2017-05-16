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

export EDITOR=vi
