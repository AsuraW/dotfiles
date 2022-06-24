# TODO fix grc and autocompletion blyat
# vim:fileencoding=utf-8:ft=zsh:foldmethod=marker
#
#
#	                 ___====-_  _-====___
#	           _--~~~#####//      \\#####~~~--_    This is my attic. I tend to
#	        _-~##########// (    ) \\##########~-_    avoid this place because
#	       -############//  :\^^/:  \\############-    of the dragons, but if
#	     _~############//   (@::@)   \\############~_   you are courageous
#	    ~#############((     \\//     ))#############~   enough, feel free to
#	   -###############\\    (^^)    //###############-   wander here at your
#	  -#################\\  / "" \  //#################-   own risk. Who knows,
#	 -###################\\/      \//###################-   maybe you will find
#	_#/:##########/\######(   /\   )######/\##########:\#_   some treasures.
#	:/ :#/\#/\#/\/  \#/\##\  :  :  /##/\#/  \/\#/\#/\#: \:
#	"  :/  V  V  "   V  \#\: :  : :/#/  V   "  V  V  \:  "           - aw
#	   "   "  "      "   \ : :  : : /   "      "  "   "

#: Env stuff{{{

# Must be at top of zshrc
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -U bashcompinit
bashcompinit
autoload -Uz compinit

export GOPATH="$HOME/.go"
export GEM_HOME="$HOME/.gem"
export LOCALBIN="$HOME/.local/bin"
export NPM="$HOME/.npm"
unset SSH_ASKPASS
export GPG_TTY=$(tty)

export PATH=$HOME/bin:/usr/local/bin:$LOCALBIN:$GOPATH/bin:$GEM_HOME/ruby/3.0.0/bin:$NPM:$PATH

#: Zsh env{{{
DISABLE_AUTO_TITLE="true"
compinit /usr/share/zsh/functions/Completion/Unix/*
PROMPT_EOL_MARK=""
SAVEHIST=500000
# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nvim'
 fi
#:}}}

#:}}}
#: Antigen{{{
#

source $HOME/.antigen/antigen.zsh
# Theme
antigen theme romkatv/powerlevel10k
# Load the oh-my-zsh library
antigen use oh-my-zsh
antigen bundle archlinux
antigen bundle tmux
antigen bundle git
antigen bundle fzf


# Other plugins
antigen bundle Aloxaf/fzf-tab
antigen bundle svenXY/timewarrior
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen apply
#:}}}
#: fzf-tab testing{{{
bindkey '^Xh' _complete_help
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false

# set descriptions format to enable group support optional blyat =)
#zstyle ':completion:*:descriptions' format '[%d]'

# switch group using `,` and `.` working only with previous setting uncommented
# zstyle ':fzf-tab:*' switch-group ',' '.'

# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath' # remember to use single quote here!!!
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'
zstyle ':fzf-tab:complete:*:options' fzf-preview
zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview \
	'git diff $word | delta'
zstyle ':fzf-tab:complete:git-log:*' fzf-preview \
	'git log --color=always $word'
zstyle ':fzf-tab:complete:git-help:*' fzf-preview \
	'git help $word | bat -plman --color=always'
zstyle ':fzf-tab:complete:git-show:*' fzf-preview \
	'case "$group" in
	"commit tag") git show --color=always $word ;;
	*) git show --color=always $word | delta ;;
	esac'
zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview \
	'case "$group" in
	"modified file") git diff $word | delta ;;
	"recent commit object name") git show --color=always $word | delta ;;
	*) git log --color=always $word ;;
	esac'
zstyle ':fzf-tab:complete:cd:*' popup-pad 60 1
#}}}
#: Alias{{{

alias vim='nvim'
alias v='nvim'
alias sv='sudoedit'
alias unlockuser='faillock --reset --user $USER'
alias zshconfig='nvim ~/.zshrc'
alias exexe='exec zsh'
alias vconfig='nvim ~/.config/nvim/init.vim'
alias kconf='nvim ~/.config/kitty/kitty.conf'
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
alias lockscreen='loginctl lock-session self'
alias unlockscreen='loginctl unlock-session self'
alias mozillacfg='sudoedit /usr/lib/firefox/mozilla.cfg'
alias myip='wget -qO- https://wtfismyip.com/text'       # quickly show external ip address
alias wget='wget -c'
alias dl='aria2c -x 16 -j 64 -s 64 -c $1'
alias dlp='proxychains4 -q aria2c -x 16 -j 64 -s 64 -c $1'
alias wtf='sudo dmesg'
alias yolo='git commit -m "$(curl -s http://whatthecommit.com/index.txt)"'
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

#}}} 
#: Functions{{{
# TODO:
# Add options to record-screen
# Screen recording for X11 sessions
record-screen() {
ffmpeg -f x11grab -framerate 25 $(xwininfo | gawk 'match($0, /-geometry ([0-9]+x[0-9]+).([0-9]+).([0-9]+)/, a) { print "-video_size " a[1] " -i +" a[2] "," a[3] }') ~/Videos/$(date +%Y-%m-%d_%H-%M_%S).mp4
}

# Add random joke to your output
dadjoke() {
    curl -s https://icanhazdadjoke.com
}

# Find dictionary definition
dict() {
    if [ "$3" ]; then
        curl "dict://dict.org/d:$1 $2 $3"
    elif [ "$2" ]; then
        curl "dict://dict.org/d:$1 $2"
    else
        curl "dict://dict.org/d:$1"
    fi
}

# Find geo info from IP
ipgeo() {
    # Specify ip or your ip will be used
    if [ "$1" ]; then
        curl -s "http://api.db-ip.com/v2/free/$1" | jq
    else
        curl -s "http://api.db-ip.com/v2/free/$(myip)" | jq
    fi
}

# Speedtest 
speedtest() {
    curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 - 
}

# Lazy manpage
cheat() {
    if [ "$2" ]; then
        curl "https://cheat.sh/$1/$2+$3+$4+$5+$6+$7+$8+$9+$10"
    else
        curl "https://cheat.sh/$1"
    fi
}

# ssh proxy
sshproxy() {
        ssh -D $1 $2 -f -N -vv
}

# wireshark over ssh 
wireshark_ssh() {
    wireshark -k -i <(ssh $1 "sudo -i tcpdump -i any port not 22  -n -w - -U -s 0 2>/dev/null")
}

# Quick password generator 
pass_gen() {
    dd if=/dev/urandom bs=1 count=600 2>/dev/null | base64 -w 0| head -c "$1"
    printf "\n"
}

pass_gen_safe() {
        keepassxc-cli generate -L $1 -l -n -s -e --every-group
}

# CTF things
md5pass() {
echo -n $1 | md5sum
}

# Search for nmap scripts
nmap_search() {
find /usr/share/nmap/scripts/ -type f | grep $1
} 

# Decode base64
base64d() {
echo -n $1 | base64 -d
}

# Get ip from network interface. Invoke ipself once to enable autocompletion.
ipself() {
        if [ $# -eq 0 ]; then
                IF="wlo1"
        else
                IF=$1
        fi

        ifconfig $IF | grep 'inet ' | awk '{print $2}'


complete -W "`find /sys/class/net/ -mindepth 1 -printf '%f '`" ipself

ipof() 
        ping -c 1 $1 | grep "bytes from" | awk '{print $4}' | sed 's/.$//'
}

# 🌚
check_proxy() {
        cat $1 | soxy | tee $2
}

# Quickly pull any sharp tool from github.
SharpCollection() { print -z `curl -sSL "https://api.github.com/repos/Flangvik/SharpCollection/git/trees/master?recursive=1" | jq -r ".tree[].path" | grep \\.exe | while read line; do echo "curl -sSL https://github.com/Flangvik/SharpCollection/raw/master/$line >"; done | fzf --tac` }

# temp.sh limit 4GB 3 days
up() {

if [ $# -eq 0 ] && tty -s
	then echo -e "Usage:  up /tmp/file2upload\n\techo 'memes' | up whatever.txt\n\tps aux | up"
	exit 1
        fi
        f="nofilename"
        if [ $# -eq 1 ]
        	then f=$1
        fi
        if tty -s
        	then curl -# -w "\n" -T $1 https://temp.sh
        else curl -# -w "\n" -T "-" https://temp.sh/$f
fi
}

# transfer.sh no size limit 14 days
transfer(){ if [ $# -eq 0 ];then echo "No arguments specified.\nUsage:\n  transfer <file|directory>\n  ... | transfer <file_name>">&2;return 1;fi;if tty -s;then file="$1";file_name=$(basename "$file");if [ ! -e "$file" ];then echo "$file: No such file or directory">&2;return 1;fi;if [ -d "$file" ];then file_name="$file_name.zip" ,;(cd "$file"&&zip -r -q - .)|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null,;else cat "$file"|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;fi;else file_name=$1;curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;fi;}

histdeln(){
  # Get the current history number
  n=$(history 1 | awk '{print $1}')

  # Call histdel with the appropriate range
  histdel $(( $n - $1 )) $(( $n - 1 ))
  }

# Download file from anonfiles or similiar resource
dlanon(){
wget $(curl -s -L $1 | grep -A2 'download-url' | grep 'href' | cut -d'"' -f2 | sed 's; ;%20;g')
}


#:}}}
#: End Functions{{{

# grc aliases
for cmd in g++ gas head w make ld ping6 tail traceroute6 $( ls /usr/share/grc/ ); do
  cmd="${cmd##*conf.}"
  type "${cmd}" >/dev/null 2>&1 && alias "${cmd}"="$( which grc ) --colour=auto ${cmd}"
done
alias ls='lsd' # we have to define lsd alias after grc aliases  

# bash in TTY sessions
if [ `tput colors` != "256" ]; then
  exec bash -l;
fi


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#}}}

