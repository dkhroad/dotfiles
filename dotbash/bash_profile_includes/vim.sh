OS=`uname`
if [ $OS = 'Darwin' ]; then
  alias  vims="mvim --servername FOOBAR"
  alias vimc="mvim --servername FOOBAR --remote"
  alias vi="mvim -v"
else
  alias  vims="vim --servername FOOBAR"
  alias vimc="vim --servername FOOBAR --remote"
  export TERM="xterm-256color"
fi

export EDITOR=vi
