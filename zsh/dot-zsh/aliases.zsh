
alias ls="ls --color=auto"

change_nvim_background() {
  local bg=$1
  sed -i '' "s/vim.o.background = \"[a-z]*\"/vim.o.background = \"$bg\"/" ~/.config/nvim/lua/config/options.lua
}
function dark() {
  # ln -fs ~/.config/alacritty/themes/themes/solarized_osaka.toml ~/.config/alacritty/themes/_active.toml
  ln -fs ~/.config/alacritty/themes/themes/gruvbox_dark.toml ~/.config/alacritty/themes/_active.toml
  touch ~/.config/alacritty/alacritty.toml
  change_nvim_background "dark"
}

function light() {
  ln -fs ~/.config/alacritty/themes/themes/github_light.toml ~/.config/alacritty/themes/_active.toml
  touch ~/.config/alacritty/alacritty.toml
  change_nvim_background "light"
}
# ---- Zoxide (better cd) ----
# alias cd="z" # zoxide

alias ls="eza --icons=always"
