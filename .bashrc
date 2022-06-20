#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Make colorcoding available for everyone

Black='\[\e[0;30m\]'	# Black
Red='\[\e[0;31m\]'		# Red
Green='\[\e[0;32m\]'	# Green
Yellow='\[\e[0;33m\]'	# Yellow
Blue='\[\e[0;34m\]'		# Blue
Purple='\[\e[0;35m\]'	# Purple
Cyan='\[\e[0;36m\]'		# Cyan
White='\[\e[0;37m\]'	# White

# Bold
BBlack='\[\e[1;30m\]'	# Black
BRed='\[\e[1;31m\]'		# Red
BGreen='\[\e[1;32m\]'	# Green
BYellow='\[\e[1;33m\]'	# Yellow
BBlue='\[\e[1;34m\]'	# Blue
BPurple='\[\e[1;35m\]'	# Purple
BCyan='\[\e[1;36m\]'	# Cyan
BWhite='\[\e[1;37m\]'	# White

# Background
On_Black='\[\e[40m\]'	# Black
On_Red='\[\e[41m\]'		# Red
On_Green='\[\e[42m\]'	# Green
On_Yellow='\[\e[43m\]'	# Yellow
On_Blue='\[\e[44m\]'	# Blue
On_Purple='\[\e[45m\]'	# Purple
On_Cyan='\[\e[46m\]'	# Cyan
On_White='\[\e[47m\]'	# White

NC='\[\e[m\]'			# Color Reset

ALERT="${BWhite}${On_Red}" # Bold White on red background

# Useful aliases

alias vim='nvim'
alias v='nvim'
alias sv='sudoedit'
alias zshconfig='nvim ~/.zshrc'
alias exexe='exec zsh'
alias vconfig='nvim ~/.config/nvim/init.vim'
alias fdd='fd . -type d -name'
alias ff='find . -type f -name'
alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS}'
alias h='history'
alias p='ps -f'
alias ldot='ls -ld .*'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias man='batman'
alias rm='rm -i'
alias dud='du -d 1 -h'
alias duf='du -sh'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias neofetch='neofetch --source ~/.config/neofetch/uranus.txt'
alias hd='hexdump -C'
alias myip='wget -qO- https://wtfismyip.com/text'       # quickly show external ip address
alias wget='wget -c'
alias dl='aria2c -x 16 -j 64 -s 64 -c $1'
alias dlp='proxychains4 -q aria2c -x 16 -j 64 -s 64 -c $1'
alias wtf='sudo dmesg'
alias moar='more'
alias tldr='less'
alias nomz='ps aux'
alias cya='sudo systemctl hibernate'
alias kthxbai='halt'
alias pwned='ssh'
alias cat='bat -p'
alias a='arsenal'
alias ta='tmux attach -t'
alias tad='tmux attach -d -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tksv='tmux kill-server'
alias tkss='tmux kill-session -t'
alias tmuxconf='$EDITOR $ZSH_TMUX_CONFIG'
GRC_ALIASES=true
[[ -s "/etc/profile.d/grc.sh" ]] && source /etc/profile.d/grc.sh

# Set PATH so it includes user's private bin directories
PATH="${HOME}/bin:${HOME}/.local/bin:${PATH}"

# Set prompt
PS1="${Yellow}\u@\h${NC}: ${Blue}\w${NC} \\$ "

source /home/$USER/.local/opt/fzf-obc/bin/fzf-obc.bash
