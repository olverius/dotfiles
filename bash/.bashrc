#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# --- Tools ---
eval "$(starship init bash)"
eval "$(zoxide init bash --cmd cd)"
eval "$(fzf --bash)"

# --- Better defaults ---
alias ls='eza --icons --group-directories-first'
alias ll='eza -la --icons --group-directories-first --git'
alias lt='eza --tree --level=2 --icons'
alias cat='bat --style=plain --paging=never'
export BAT_THEME="gruvbox-dark"

# --- fzf in Gruvbox Material ---
export FZF_DEFAULT_OPTS="--color=bg+:#3c3836,bg:#282828,spinner:#89b482,hl:#d8a657 \
--color=fg:#d4be98,header:#d8a657,info:#7daea3,pointer:#a9b665 \
--color=marker:#a9b665,fg+:#d4be98,prompt:#a9b665,hl+:#d8a657"
# cmatrix: match its background to the terminal so there's no frame
cmatrix() {
  printf '\e]4;0;#282828\a'
  command cmatrix "$@"
  printf '\e]4;0;#3c3836\a'
}
# yazi: "y" opens it, and quitting with q cd's into the folder you were in
y() {
  local tmp
  tmp="$(mktemp -t yazi-cwd.XXXXXX)"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

export PATH="$HOME/.config/composer/vendor/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"
