
alias ls="ls --color=auto"
# ---- Zoxide (better cd) ----
# alias cd="z" # zoxide
if [ -n "$OBSIDIAN_VAULT" ]; then
    alias oo='cd "$OBSIDIAN_VAULT"'
    alias or='vim "$OBSIDIAN_VAULT/inbox/"*.md'
    # alias ou='cd $HOME/notion-obsidian-sync-zazencodes && node batchUpload.js --lastmod-days-window 5'
else
    echo "OBSIDIAN_VAULT environment variable is not set. Obsidian aliases were not created."
fi

alias nvc='cd ~/.config/nvim/lua && nvim'
alias nvz='cd ~/.zsh && nvim'
