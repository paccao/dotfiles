source /usr/share/cachyos-fish-config/cachyos-config.fish

alias l='ls -AlhF --group-directories-first --color=auto'
alias g='git'
alias gs='git status'
alias ga='git add .'
alias gc='git commit'
alias gp='git pull'
alias gsm='git switch $(git symbolic-ref refs/remotes/origin/HEAD | sed "s@^refs/remotes/origin/@@")'
alias zed='zeditor'

set -gx PATH $PATH $HOME/bin
# overwrite greeting
# potentially disabling fastfetch
function fish_greeting
    # smth smth
end
