OS=`uname`
if [ $OS = 'Darwin' ]; then
  alias  vims="mvim --servername FOOBAR"
  alias vimc="mvim --servername FOOBAR --remote"
  alias vi="mvim -v"
else
  alias  vims="gvim --servername FOOBAR"
  alias vimc="gvim --servername FOOBAR --remote"
fi
