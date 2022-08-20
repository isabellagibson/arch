[[ $- != *i* ]] && return

# Aliases
alias la='ls -A'
alias l='ls -CF'
alias ll='ls -alF'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'	
alias ls='ls --color=auto'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias grep='grep --color=auto'
alias ..='cd ..'

# Exports
export EDITOR=nano
export HISTCONTROL=ignoreboth
export TERM=alacritty
export MYNAME
export LESS='-M'
export CLICOLOR=1
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export PATH="$USER/.local/bin:$PATH"

# PS1/PS2 format
PS1="\n \[\033[0;34m\]┌─────(\[\033[1;35m\]\u\[\033[0;34m\])─────(\[\033[1;32m\]\w\[\033[0;34m\]) \n └> \[\033[1;36m\]\$ \[\033[0m\]"
PS2="\[${yellow}\]→ \[${reset}\]";

