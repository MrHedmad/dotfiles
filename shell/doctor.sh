#!/usr/bin/env zsh

cecho() {
    echo "\e[${1}m$2\e[0m"
}
section() {
    echo -n "=> "; cecho 96 $1
}

cecho 33 "The doctor will see you now..."

section "Checking everything is installed properly..."

declare -A utils
utils=( \
    [fd]="https://github.com/sharkdp/fd (fd)" \
    [bat]="https://github.com/sharkdp/bat (bat)" \
    [tree]="https://en.wikipedia.org/wiki/Tree_(command) (tree)" \
    [rg]="https://github.com/BurntSushi/ripgrep (ripgrep)" \
    [fzf]="https://github.com/junegunn/fzf (fzf)" \
    [sponge]="https://man.archlinux.org/man/sponge.1 (moreutils)" \
    [nvim]="https://neovim.io (neovim)" \
    [git-lfs]="https://https://git-lfs.com/" \
    [gpclient]="https://github.com/yuezk/GlobalProtect-openconnect"
)

for util link in ${(kv)utils}; do
    if command -v $util &> /dev/null ; then
        echo "    - ✅ \e[92m'$util' is installed!\e[0m"
    else
        echo "    - ⚠️  \e[91m'$util' not found.\e[0m Find it @ $link"
    fi
done

section "Checking for dotfile updates..."
git -C $HOME/.dotfiles/ fetch
echo -n "Are dotfiles up-to-date? "
UPSTREAM=${1:-'@{u}'}
LOCAL=$(git -C $HOME/.dotfiles rev-parse @)
REMOTE=$(git -C $HOME/.dotfiles rev-parse "$UPSTREAM")
BASE=$(git -C $HOME/.dotfiles merge-base @ "$UPSTREAM")

if [ $LOCAL = $REMOTE ]; then
    cecho 92 "Yes!"
elif [ $LOCAL = $BASE ]; then
    cecho 91 "No! Pull new configs from remote."
elif [ $REMOTE = $BASE ]; then
    cecho 94 "There are local commits to push to remote."
else
    cecho 91 "No! Local and remote branches have diverged!"
fi

