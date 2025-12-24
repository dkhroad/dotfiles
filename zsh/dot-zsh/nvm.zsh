
export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" --no-use  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# lazynvm() {
#   unset -f nvm node npm
#
#   export NVM_DIR=~/.nvm
#   [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh --no-use"  # This loads nvm
#   [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#
# }

# nvm() {
#   lazynvm 
#   nvm $@
# }
#
# node() {
#   lazynvm
#   node $@
# }
#
# npm() {
#   lazynvm
#   npm $@
# }
#
# npx() {
#   lazynvm
#   npx $@
# }
