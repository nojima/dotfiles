#
# autoload
#
autoload colors
colors
autoload -U compinit
compinit

#
# prompt
#
PROMPT="
%B%{${fg[green]}%}%m:%{${fg[blue]}%}%/
%{${fg[cyan]}%}%n%#%{${reset_color}%}%b "
PROMPT2="%B%{${fg[cyan]}%}...:%{${reset_color}%}%b "

#
# aliases
#
alias ls="ls --color"
alias la="ls -a"
alias ll="ls -l"
alias grep="grep -n --color=auto"
alias -g L="| less -r"
alias -g G="| grep"

#
# options
#
setopt print_eight_bit
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt list_packed
setopt noautoremoveslash
setopt nolistbeep
bindkey -e

#
# exports
#
export EDITOR=vim
export LANG=en_US.UTF-8
export PATH=$HOME/bin:$HOME/.rbenv/bin:$PATH

#
# Misc
#
eval "$(rbenv init -)"

# work around for a gvim bug in Ubuntu 12.04
alias gvim="gvim -f"
