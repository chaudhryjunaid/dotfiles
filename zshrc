#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
if [ -f /usr/local/share/liquidprompt ]; then
  . /usr/local/share/liquidprompt
fi

export VISUAL='vim'
export EDITOR="$VISUAL"

alias tmux='tmux -2 -u'

# 10ms for key sequences
KEYTIMEOUT=1

unalias mysql

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
