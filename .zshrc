# Source file, if it exists
function try-source() {
  if [ -f $1 ]; then
    source $1;
  fi
}

source ~/antigen.zsh

antigen bundle robbyrussell/oh-my-zsh lib/

HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=10000

setopt appendhistory autocd beep extendedglob nomatch
bindkey -v
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit
compinit

# Detect OS
UNAME=`uname`
CURRENT_OS='Linux'
DISTRO=''

if [[ $UNAME == 'Darwin' ]]; then
    CURRENT_OS='OS X'
else
    # Must be Linux, determine distro
    # Work in progress, so far CentOS is the only Linux distro I have needed to
    # determine
    if [[ -f /etc/redhat-release ]]; then
        # CentOS or Redhat?
        if grep -q "CentOS" /etc/redhat-release; then
            DISTRO='CentOS'
        else
            DISTRO='RHEL'
        fi
    fi
fi

# antigen bundles (https://github.com/zsh-users/antigen)
antigen bundles <<EOBUNDLES
  fasd
  zsh-users/zsh-syntax-highlighting
  jira
  jsontools
EOBUNDLES

# activate theme
antigen theme https://gist.github.com/sethmcl/5567c8519760c8e7b5d2 agnoster

# vim key bindings
bindkey -v

antigen apply
