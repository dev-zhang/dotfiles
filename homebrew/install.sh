#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

ensure_command_line_tools() {
  if test "$(uname)" != "Darwin"
  then
    return 0
  fi

  if xcode-select -p >/dev/null 2>&1
  then
    return 0
  fi

  echo "  Installing Xcode Command Line Tools for you."
  xcode-select --install >/dev/null 2>&1 || true
  echo "  Finish installing Xcode Command Line Tools, then run this command again."
  exit 1
}

ensure_command_line_tools

# Check for Homebrew
if ! command -v brew >/dev/null 2>&1
then
  echo "  Installing Homebrew for you."

  # Install the correct homebrew for each OS type
  if test "$(uname)" = "Darwin"
  then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
  fi

fi

exit 0
