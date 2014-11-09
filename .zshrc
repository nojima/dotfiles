# vim: foldmethod=marker

# oh-my-zsh {{{
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
if [[ -f $ZSH/themes/blinks-nojima.zsh-theme ]]; then
    ZSH_THEME="blinks-nojima"
else
    ZSH_THEME="blinks"
fi

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=()

source $ZSH/oh-my-zsh.sh
# }}}

# export {{{
export LANG=en_US.UTF-8
export EDITOR=vim
# }}}

# alias {{{
alias gco="git checkout"
alias gd="git diff"
alias gdh="git diff HEAD^"
alias gl="git log"
alias glp="git log -p"
alias gls="git log --stat"
alias gs="git status -s"
alias tmux="tmux -2"
alias rtags="ctags -f TAGS -R ."
alias -g L="| less -R"
alias -g G="| grep"
# }}}

# ssh agent {{{
#ssh_agent_script=/tmp/ssh-agent-$USER.sh
#if ! [[ -f $ssh_agent_script ]]; then
#  touch $ssh_agent_script
#  chmod 600 $ssh_agent_script
#  ssh-agent > $ssh_agent_script
#fi
#source $ssh_agent_script
# }}}

# export paths {{{
if [[ -d $HOME/bin ]]; then
    export PATH=$HOME/bin:$PATH
fi

for d in $HOME/opt/*/bin(N); do
    if [[ -d $d ]]; then
        export PATH=$d:$PATH
    fi
done

if [[ -d $HOME/.rbenv ]]; then
    export PATH=$HOME/.rbenv/bin:$PATH
    eval "$(rbenv init -)"
fi

if [[ -d /usr/local/go ]]; then
    export PATH=/usr/local/go/bin:$PATH
    export GOROOT=/usr/local/go
fi

if which direnv > /dev/null; then
    eval "$(direnv hook zsh)"
fi
# }}}

# misc {{{
HISTSIZE=100000
SAVEHIST=1000000
stty stop undef
# }}}

# load local settings {{{
if [[ -f $HOME/.zshrc_local ]]; then
    source $HOME/.zshrc_local
fi
# }}}

typeset -U path
