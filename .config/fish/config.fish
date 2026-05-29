source /usr/share/cachyos-fish-config/cachyos-config.fish

alias l='ls -AlhF --group-directories-first --color=auto'
alias g='git'
alias gs='git status'
alias ga='git add .'
alias gc='git commit'
alias gp='git pull'
alias gsm='git switch $(git symbolic-ref refs/remotes/origin/HEAD | sed "s@^refs/remotes/origin/@@")'
alias zed='zeditor'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias clipboard='xclip -selection c'
alias sdocs='rg -w ~/Documents -e ' # search ~/Documents and print path to file
alias sodocs='sdocs $1 | awk {grep pwd} | vim'
alias osdocs='cd ~/Documents && fzf > fzfout && vim $(cat fzfout)' # search ~/Documents with fzf and open file in vim


set -gx PATH $PATH $HOME/bin
# overwrite greeting
# potentially disabling fastfetch
function fish_greeting
    # smth smth
end
