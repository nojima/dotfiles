function _prompt_char() {
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    echo "%{%F{blue}%}%{%f%k%b%}"
  else
    echo ' '
  fi
}

# This theme works with both the "dark" and "light" variants of the
# Solarized color schema.  Set the SOLARIZED_THEME variable to one of
# these two values to choose.  If you don't specify, we'll assume you're
# using the "dark" variant.

case ${SOLARIZED_THEME:-dark} in
    light) bkg=white;;
    *)     bkg=black;;
esac

ZSH_THEME_GIT_PROMPT_PREFIX="%F{cyan}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%B%F{cyan}%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{%F{red}%}*%{%f%k%b%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='%{%f%k%b%}
%B%F{blue}%(?.[%?].%F{magenta}[%?]%F{blue})[%D{%m/%d %H:%M:%S}][%m]%F{green}[%~]$(git_prompt_info)%E%{%f%k%b%}
%#%{%f%k%b%} '

RPROMPT=
