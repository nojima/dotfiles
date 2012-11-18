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
alias ll="ls -al"
alias grep="grep -n --color=auto"
alias l="ls"
alias v="vim"
alias g="git"
alias u="cd .."
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
setopt extended_history
setopt append_history
setopt hist_ignore_dups
setopt share_history
bindkey -e

HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=1000000

#
# history search
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

#
# edit command line
#
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

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
