eval "$(starship init zsh)"
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
export ZSH="$HOME/.oh-my-zsh"

plugins=(git
	zsh-autosuggestions
	aliases
	golang
        dotenv
        colored-man-pages
        vi-mode
)

source $ZSH/oh-my-zsh.sh
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.cache/zsh/history


alias ll="eza -l -g --icons --git"
alias ls="eza --icons -g --git"
alias llt="eza -1 --icons --tree --git-ignore"
alias cd="z"
alias ci="zi"
alias cat="bat"
alias grep="rg"

# Git Aliases
alias gs="git status -v --long -b"
alias gc="git commit -m "

alias vim="nvim"
alias vi="nvim"
alias v="nvim"
alias sed="/opt/homebrew/bin/gsed"
export PATH="$PATH:/usr/local/go/bin:/Users/debabratachoudhury/go/bin:/Users/debabratachoudhury/workspace/bin"
export PATH="$PATH:/Users/debabratachoudhury/workspace/bin/protoc-21.12-osx-universal_binary/bin/:/Users/debabratachoudhury/Library/Python/3.9/bin"
# ~/.tmux/plugins
export PATH=$HOME/.tmux/plugins/t-smart-tmux-session-manager/bin:$PATH
# ~/.config/tmux/plugins
export PATH=$HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin:$PATH
export PATH="$PATH:/Users/debabratachoudhury/Library/Application Support/Coursier/bin"


export FZF_DEFAULT_OPTS="--reverse --border rounded --no-info --pointer='' --marker=' ' --ansi --color='16,bg+:-1,gutter:-1,prompt:5,pointer:5,marker:6,border:4,label:4,header:italic'"

export FZF_CTRL_R_OPTS="--border-label=' history ' --prompt='  '"
alias ssh="TERM=xterm-256color /usr/bin/ssh"

export EDITOR=nvim
autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

export VI_MODE_SET_CURSOR=true
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]]; then
    echo -ne '\e[2 q' # block
  else 
    echo -ne '\e[6 q'
  fi 
}


zle -N zle-keymap-select
function zle-line-init() {
  zle -K viins
  echo -ne '\e[6 q'
}

zle -N zle-line-init

function vi-yank-clipboard {
  zle vi-yank
  echo "$CUTBUFFER" | pbcopy -i
}

zle -N vi-yank-clipboard
bindkey -M vicmd 'y' vi-yank-clipboard

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export PAGER="bat --theme=Catppuccin-mocha"

alias lg="lazygit"

lfcd () {
    tmp="$(mktemp)"
    # `command` is needed in case `lfcd` is aliased to `lf`
    command lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}
bindkey -s '^o' 'lfcd\n'
bindkey -v
eval "$(zoxide init zsh)"


function brew() {
  command brew "$@" 

  if [[ $* =~ "upgrade" ]] || [[ $* =~ "update" ]] || [[ $* =~ "outdated" ]]; then
    sketchybar --trigger brew_update
  fi
}

function sesh-sessions() {
  {
    exec </dev/tty
    exec <&1
    local session
    session=$(sesh list -t -c | fzf --height 40% --reverse --border-label ' sesh ' --border --prompt '⚡  ')
    [[ -z "$session" ]] && return
    sesh connect $session
  }
}

zle     -N             sesh-sessions
bindkey -M emacs '\es' sesh-sessions
bindkey -M vicmd '\es' sesh-sessions
bindkey -M viins '\es' sesh-sessions

alias :GoToFile="nvim +GoToFile"
alias :GoToCommand="fzf-history-widget"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# [ -f "/Users/debabratachoudhury/.ghcup/env" ] && source "/Users/debabratachoudhury/.ghcup/env" # ghcup-env

export PATH=$PATH:/Users/debabratachoudhury/.local/bin
export PATH="/opt/homebrew/opt/curl/bin:$PATH"

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

