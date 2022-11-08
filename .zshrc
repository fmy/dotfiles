# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug 'themes/ys', from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/svn", from:oh-my-zsh
zplug "plugins/brew", from:oh-my-zsh
zplug "plugins/brew-cask", from:oh-my-zsh
zplug "plugins/osx", from:oh-my-zsh
zplug "plugins/gpg-agent", from:oh-my-zsh
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "b4b4r07/enhancd", use:init.sh
zplug "rupa/z", use:"*.sh"
zplug "b4b4r07/emoji-cli"
zplug "greymd/tmux-xpanes"

if ! zplug check; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load

[ -f ~/.zshrc.path ] && source ~/.zshrc.path
[ -f ~/.zshrc.custom ] && source ~/.zshrc.custom
[ -f ~/.zshrc.env ] && source ~/.zshrc.env
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
