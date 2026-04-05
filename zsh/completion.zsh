# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

if (( $+commands[brew] ))
then
  brew_prefix="$(brew --prefix)"

  if [ -f "$brew_prefix/opt/zsh-autosuggestions/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]
  then
    source "$brew_prefix/opt/zsh-autosuggestions/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
  fi

  if [ -f "$brew_prefix/opt/zsh-syntax-highlighting/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]
  then
    source "$brew_prefix/opt/zsh-syntax-highlighting/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  fi

  unset brew_prefix
fi
