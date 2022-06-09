# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# WSLでコマンドの補完が遅いことへの対策
unsetopt PATH_DIRS

# リダイレクトによる上書きを禁止する
setopt noclobber

# Ctrl-S でターミナルをサスペンドしない
stty stop undef

HISTSIZE=100000
SAVEHIST=1000000

export LANG=en_US.UTF-8
export EDITOR=vim

alias gco="git checkout"
alias gd="git diff"
alias gdh="git diff 'HEAD^'"
alias gl="git log"
alias glp="git log -p"
alias gls="git log --stat"
alias gs="git status -s"
alias tmux="tmux -2"
alias rtags="ctags -f TAGS -R ."
alias k="kubectl"
alias kg="kubectl get"
alias kgp="kubectl get pod"
alias kd="kubectl describe"
alias kdp="kubectl describe pod"
alias kl="kubectl logs"
alias history="fc -li 1"
alias -g L="| less -R"
alias -g LL="2>&1 | less -R"
alias -g G="| grep"
alias -g GG="2>&1 | grep"
alias -g H="| head"
alias -g HH="2>&1 | head"

if [[ -d $HOME/bin ]]; then
    export PATH=$HOME/bin:$PATH
fi

if [[ -d $HOME/go/bin ]]; then
    PATH="$HOME/go/bin:$PATH"
fi

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

if which zoxide > /dev/null; then
    eval "$(zoxide init zsh)"
    export _ZO_FZF_OPTS='--height 90%'
fi

if [[ -f $HOME/.cargo/env ]]; then
    . "$HOME/.cargo/env"
fi

if [[ -f $HOME/.asdf/asdf.sh ]]; then
    . "$HOME/.asdf/asdf.sh"
fi

if [[ -f $HOME/.fzf.zsh ]]; then
    . "$HOME/.fzf.zsh"
    export FZF_DEFAULT_OPTS='--height 90%'
fi

if which starship > /dev/null; then
    eval "$(starship init zsh)"
fi

if which kubectl > /dev/null; then
    source <(kubectl completion zsh)
fi

# load local settings
if [[ -f $HOME/.zshrc_local ]]; then
    . $HOME/.zshrc_local
fi
