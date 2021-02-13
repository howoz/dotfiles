# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# Prompt
#

PROMPT='%f[%F{yellow}%2~%f] %# '
RPROMPT='%(?,,[%F{red}%?%f])${vcs_info_msg_0_}'

#
# Git Integration
#

autoload -Uz vcs_info
setopt promptsubst

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '%F{red}✗%f'
zstyle ':vcs_info:*' stagedstr '%F{yellow}+%f'
zstyle ':vcs_info:*' formats ' [%b%u%c]'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

precmd () { vcs_info }

+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
     git status --porcelain | grep '??' &>/dev/null
  then
    hook_com[unstaged]+='%F{yellow}?%f'
  fi
}

#
# Aliases
#

alias rm='rm -v'
alias mv='mv -iv'
alias cp='cp -iv'
alias cl='clear'
alias ex='exit'
alias ra='ranger'
alias vim='nvim'
alias lsa='ls -lah'
alias sudo='doas'
alias pacman='doas pacman'
alias reboot='doas reboot'
alias shutdown='doas shutdown'
alias rc-update='doas rc-update'
alias rc-service='doas rc-service'
alias claws-mail="claws-mail --alternate-config-dir $XDG_DATA_HOME/claws-mail"
alias recordscreen='ffmpeg -framerate 30 -f x11grab -i :0.0 -c:v libx264rgb -crf 0 -preset ultrafast ~/out.mkv'

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Prompt for spelling correction of commands.
setopt CORRECT

# Customize spelling correction prompt.
SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

#
# LS_COLORS
#

. $ZDOTDIR/.dir_colors.zsh

# --------------------
# Module configuration
# --------------------

#
# completion
#

# Set a custom path for the completion dump file.
# If none is provided, the default ${ZDOTDIR:-${HOME}}/.zcompdump is used.
#zstyle ':zim:completion' dumpfile "${ZDOTDIR:-${HOME}}/.zcompdump-${ZSH_VERSION}"

# Completion waiting dots
completion-waiting-dots() {
	print -Pn "%F{red}…%f"
	zle expand-or-complete
	zle redisplay
}
zle -N completion-waiting-dots
bindkey -M emacs "^I" completion-waiting-dots

setopt menucomplete
unsetopt flowcontrol

# Refresh completion cache when new packages are installed

zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook

rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}

add-zsh-hook -Uz precmd rehash_precmd

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
zstyle ':zim:input' double-dot-expand yes

#
# zsh-autosuggestions
#

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'

# ------------------
# Initialize modules
# ------------------

if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  # Update static initialization script if it does not exist or it's outdated, before sourcing it
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Bind up and down keys
zmodload -F zsh/terminfo +p:terminfo
if [[ -n ${terminfo[kcuu1]} && -n ${terminfo[kcud1]} ]]; then
  bindkey ${terminfo[kcuu1]} history-substring-search-up
  bindkey ${terminfo[kcud1]} history-substring-search-down
fi

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
# }}} End configuration added by Zim install
