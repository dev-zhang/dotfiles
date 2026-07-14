# 初始化 mise，并将其管理的工具路径加入 PATH。
if (( $+commands[mise] )); then
  eval "$(mise activate zsh)"
fi
