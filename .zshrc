export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=vim
export PYTHONUNBUFFERED=1

ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM="$HOME/.oh-my-custom-zsh"
ZSH_THEME="vslinko"
plugins=(git node nvm npm sudo docker)

source "$ZSH/oh-my-zsh.sh"

WORKSPACE="$HOME/Workspace"
hash -d qwe="$WORKSPACE"
hash -d cd="$WORKSPACE/cian.django"
hash -d cf="$WORKSPACE/cian.django/cian/static/cf"
alias gdh='git diff HEAD'

if [ -d "$WORKSPACE/_bin" ]; then
  export PATH="$WORKSPACE/_bin:$PATH"
fi
