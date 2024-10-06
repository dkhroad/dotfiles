lazynvm() {
  unset -f nvm node npm npx
  export NVM_DIR=~/.nvm
  NVM_SH_DIR=$(brew --prefix nvm);
  [ -s "$NVM_SH_DIR/nvm.sh" ] && . "$NVM_SH_DIR/nvm.sh" # This loads nvm
  if [ -f "$NVM_SH_DIR/bash_completion" ]; then
    [ -s "$NVM_SH_DIR/bash_completion" ] && \. "$NVM_SH_DIR/bash_completion" # This loads nvm bash_completion
  fi
}


# Add every binary that requires nvm, npm or node to run to an array of node globals
NODE_GLOBALS=(`find ~/.nvm/versions/node -maxdepth 3 -type l -wholename '*/bin/*' | xargs -n1 basename | sort | uniq`)
NODE_GLOBALS+=("node")
NODE_GLOBALS+=("nvm")

# Lazy-loading nvm + npm on node globals call
load_nvm () {
  export NVM_DIR=~/.nvm
  [ -s "$(brew --prefix nvm)/nvm.sh" ] && . "$(brew --prefix nvm)/nvm.sh"
}

# Making node global trigger the lazy loading
for cmd in "${NODE_GLOBALS[@]}"; do
  eval "${cmd}(){ unset -f ${NODE_GLOBALS}; load_nvm; ${cmd} \$@ }"
done

# nvm() {
#   lazynvm 
#   nvm $@
# }
 
# node() {
#   lazynvm
#   node $@
# }
 
# npm() {
#   lazynvm
#   npm $@
# }

# npx() {
#   lazynvm
#   npx $@
# }

