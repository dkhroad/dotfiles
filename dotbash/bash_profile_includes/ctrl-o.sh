# enables CTRL+O, see
# http://apple.stackexchange.com/questions/3253/ctrl-o-behavior-in-terminal-app
if [ `uname` = "Darwin"]; then
  stty discard undef
fi
