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
alias k='kubectl'
alias k9s='k9s'
alias monitor-left-upright='xrandr --output HDMI-A-0 --mode 1920x1080 --left-of DisplayPort-0 --rate 74.97 --scale 1x1 --dpi 115 --rotate normal'
alias monitor-left-rotated='xrandr --output HDMI-A-0 --mode 1920x1080 --left-of DisplayPort-0 --rate 74.97 --scale 1x1 --dpi 115 --rotate left'

set KUBECONFIG $HOME/.kube/config
set TALOSCONFIG $HOME/c/homelab/kubernetes/bootstrap/talos/clusterconfig/talosconfig

set -Ux QT_FONT_DPI 1.5

set -gx PATH $PATH $HOME/bin
set -gx PATH $PATH $HOME/.bun/bin
# overwrite greeting
# potentially disabling fastfetch
function fish_greeting
    # smth smth
end
