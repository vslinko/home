export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=vim
export PYTHONUNBUFFERED=1

ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM="$HOME/.oh-my-custom-zsh"
ZSH_THEME="vslinko"
plugins=(git node npm sudo docker)

source "$ZSH/oh-my-zsh.sh"

WORKSPACE="$HOME/Workspace"
hash -d qwe="$WORKSPACE"
alias gdh='git diff HEAD'

if [ -d "$WORKSPACE/_bin" ]; then
  export PATH="$WORKSPACE/_bin:$PATH"
fi

export PATH="$(pyenv root)/shims:$PATH"

export NVM_DIR="$HOME/.nvm"
nvm_load () {
  . $NVM_DIR/nvm.sh
  . $NVM_DIR/bash_completion
}
alias node='unalias nvm; unalias node; unalias npm; nvm_load; node $@'
alias npm='unalias nvm; unalias node; unalias npm; nvm_load; npm $@'
alias nvm='unalias nvm; unalias node; unalias npm; nvm_load; nvm $@'

alias j='npx jest'
alias jj='npx jest --coverage=no --watch'
