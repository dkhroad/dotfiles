if [ -t  0 ]; then
  export GPG_TTY="$(tty)"
  export PINENTRY_USER_DATA=USE_TTY=1
fi
