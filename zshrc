# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'r:|[._-/\]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 3
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.*' insert-sections true
zstyle ':completion:*:man:*' menu yes select

autoload -Uz compinit
autoload -U colors && colors
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=10000
# End of lines configured by zsh-newuser-install
setopt autocd
setopt correct
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt INC_APPEND_HISTORY

function precmd () {
	git=$(git symbolic-ref HEAD 2>/dev/null)
	git="${git#refs/heads/}"
	git="%{$fg[green]%}$git%{$reset_color%}"
	RPROMPT=$git" [%3~]"
}

PROMPT="%F{red}!%f[%n][%?]%(!.#.$) "
typeset -U path
export EDITOR=vim

bindkey -v #vi-mode
bindkey "^[[5~"		history-beginning-search-backward
bindkey "^[[6~"		history-beginning-search-forward
bindkey "^?"		backward-delete-char
bindkey "^[[Z"		reverse-menu-complete

fontsize(){ printf '\33]50;%s\007' "xft:Dejavu Sans Mono:autohint=true:antialias=true:size=$1" }

alias docker-purge="docker ps -q | xargs docker stop -t 2 | xargs docker rm -v"
udocker(){ docker run -u $(id -u):$(id -g) $@ }
vdocker(){ docker run -e HOME=/wd -v $(pwd):/wd -w /wd $@ }
uvdocker(){ docker run -u $(id -u):$(id -g) -e HOME=/wd -v $(pwd):/wd -w /wd $@ }
light(){ sudo tee /sys/class/backlight/intel_backlight/brightness <<< ${1:-900} }
exec_in_0(){ tmux select-window -t 0 && tmux send-keys -t 0 "$@" Enter }

fontsize 10
GPG_TTY=$(tty)
export GPG_TTY
