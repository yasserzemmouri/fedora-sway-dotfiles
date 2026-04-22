# history
HISTFILE=/.zsh_history
HISTFILE=10000
HISTFILE=10000

# Detect if running under Sway/Wayland
if [[ "$WAYLAND_DISPLAY" ]]; then
    export TERM=xterm-kitty
    # Wayland-specific aliases
    alias screenshot='grim -g "$(slurp)" - | wl-copy'
    alias clipboard='wl-copy'
fi

# wayland support for kitty
export KITTY_ENABLE_WAYLAND=1

# === Plugins (using Oh My Zsh - optional) ===
# Install Oh My Zsh first: sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# === Zoxide - smarter cd ===
eval "$(zoxide init zsh)"

# === FZF - fuzzy finder ===
# Auto-completion and key bindings
source <(fzf --zsh)

# FZF configuration
export FZF_DEFAULT_OPTS="--height 40% --layout reverse --border"
export FZF_COMPLETION_OPTS="--border --info=inline"

# === Zoxide + FZF integration ===
# Use Ctrl+F to interactively search and jump (with zoxide's ranking)
fzf-cd-widget() {
  local dir=$(zoxide query -l | fzf --prompt="z> " \
    --preview 'eza --color=always --icons --tree --level=2 {}' \
    --preview-window 'right:60%:border-left' \
    --color 'fg:#c0caf5,fg+:#ffffff,bg+:#2c3e50,hl:#ff9e64,info:#565f89,prompt:#9ece6a,pointer:#7dcfff' \
    --ansi)
  if [[ -n "$dir" ]]; then
    BUFFER="z -- '$dir'"
    zle accept-line
  fi
}
zle -N fzf-cd-widget
bindkey '^F' fzf-cd-widget

# === Aliases for modern tools ===
# eza - modern ls replacement
alias la='eza --icons --git --group-directories-first'
alias ll='eza -lh --icons --git --group-directories-first'
alias ls='eza -la --icons --git --group-directories-first'
alias lt='eza --tree --level=2 --icons'
alias ..='cd ..'

# bat - modern cat replacement
alias cat='bat'
alias less='bat'

# === History search with fzf ===
# Ctrl+R to fuzzy search command history
function fzf-history-widget() {
  local selected=$(history -n -r 1 | fzf --query="$LBUFFER" --no-sort)
  if [[ -n "$selected" ]]; then
    BUFFER="$selected"
    CURSOR=$#BUFFER
  fi
  zle reset-prompt
}
zle -N fzf-history-widget
bindkey '^R' fzf-history-widget

eval "$(starship init zsh)"

# === Reload zsh configuration ===
alias sz='source ~/.zshrc'
