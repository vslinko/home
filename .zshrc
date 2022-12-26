export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export EDITOR=vim
export PYTHONUNBUFFERED=1

ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM="$HOME/.oh-my-custom-zsh"
ZSH_THEME="vslinko"
plugins=(git node npm sudo docker)

source "$ZSH/oh-my-zsh.sh"

WORKSPACE="$HOME/Workspace"
hash -d qwe="$WORKSPACE"
hash -d icloud="/Users/vslinko/Library/Mobile Documents/com~apple~CloudDocs"
hash -d zettel="/Users/vslinko/Library/Mobile Documents/iCloud~md~obsidian/Documents/vslinko-zettelkasten"
hash -d logseq="/Users/vslinko/Library/Mobile Documents/iCloud~com~logseq~logseq/Documents/meow"
alias gdh='git diff HEAD'

if [ -d "$WORKSPACE/_bin" ]; then
  export PATH="$WORKSPACE/_bin:$PATH"
fi

if [ -x pyenv ]; then
  export PATH="$(pyenv root)/shims:$PATH"
fi

export NVM_DIR="$HOME/.nvm"

if [ -d $NVM_DIR ]; then
  nvm_load () {
    . $NVM_DIR/nvm.sh
    . $NVM_DIR/bash_completion
  }
  alias node='unalias nvm; unalias node; unalias npm; nvm_load; node $@'
  alias npm='unalias nvm; unalias node; unalias npm; nvm_load; npm $@'
  alias nvm='unalias nvm; unalias node; unalias npm; nvm_load; nvm $@'
fi

alias j='npx jest'
alias jj='npx jest --coverage=no --watch'

export GPG_TTY=$(tty)

video2gif() {
  in=$1
  if [ ! -f "$in" ]; then
    echo "Usage: video2gif FILENAME"
    return 1
  fi
  out="$in.gif"
  tmpdir="$(mktemp -d)"
  tmpfile="$tmpdir/palette.png"
  ffmpeg -y -i "$in" -vf fps=10,palettegen "$tmpfile"
  ffmpeg -i "$in" -i "$tmpfile" -filter_complex "fps=10,paletteuse" "$out"
  rm -rf "$tmpdir"
}


#####

export DYLD_FALLBACK_LIBRARY_PATH="/usr/local/lib:/usr/lib:/lib"


# brew
if [[ $(arch) == 'arm64' ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    eval "$(/usr/local/bin/brew shellenv)"
fi



# python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
export PYCURL_SSL_LIBRARY="openssl"


# direnv
eval "$(direnv hook zsh)"  # zsh поменять на bash, если используется он



# flags
export LDFLAGS=""
export CPPFLAGS=""
export PKG_CONFIG_PATH=""

pkgs=(openssl@1.1 curl readline librdkafka zlib freetds sqlite mysql-client zstd libmemcached geos)
for pkg in $pkgs; do
    pkg_dir="$HOMEBREW_PREFIX/opt/$pkg"

    lib_dir="$pkg_dir/lib"

    if [ -d "$lib_dir" ]; then
        export LDFLAGS="$LDFLAGS -L$lib_dir"
    fi

    include_dir="$pkg_dir/include"
    if [ -d "$include_dir" ]; then
        export CPPFLAGS="$CPPFLAGS -I$include_dir"
    fi

    pkg_config_dir="$lib_dir/pkgconfig"
    if [ -d "$pkg_config_dir" ]; then
        export PKG_CONFIG_PATH="${PKG_CONFIG_PATH+$PKG_CONFIG_PATH:}$pkg_config_dir"
    fi
done

# poetry
export PATH="$HOME/.local/bin:$PATH"

# openssl
export PATH="$HOMEBREW_PREFIX/opt/openssl@1.1/bin:$PATH"
export DYLD_FALLBACK_LIBRARY_PATH="$HOMEBREW_PREFIX/opt/openssl@1.1/lib:$DYLD_FALLBACK_LIBRARY_PATH"

# curl
export PATH="$HOMEBREW_PREFIX/opt/curl/bin:$PATH"

# zstd
export LIBRARY_PATH="$HOMEBREW_PREFIX/opt/zstd/lib"

# geos
export LIBRARY_PATH="$LIBRARY_PATH:$HOMEBREW_PREFIX/opt/geos/lib"


export DENO_INSTALL="/Users/vslinko/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

export PATH="/Users/vslinko/.cargo/bin:$PATH"
