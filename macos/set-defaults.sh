# 设置合理的 macOS 默认配置。
# 或者说，按照我的喜好来配置 macOS。
# 最初的想法（以及一些设置）来源于：
#   https://github.com/mathiasbynens/dotfiles/blob/master/.macos
#
# 运行 ./set-defaults.sh 即可生效。

# 禁用长按按键显示特殊字符菜单，改为按键重复。
defaults write -g ApplePressAndHoldEnabled -bool false

# 触控板：轻点以点按
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# 触控板：三指拖移
defaults write com.apple.AppleMultitouchTrackpad DragLock -bool false
defaults write com.apple.AppleMultitouchTrackpad Dragging -bool false
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad DragLock -bool false
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Dragging -bool false
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

# 在所有网络接口上启用 AirDrop。说真的，这应该是默认设置。
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

# 始终以列表视图打开 Finder。这很重要。
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# 显示 ~/Library (资源库) 文件夹。
chflags nohidden ~/Library

# 设置极快的按键重复速度。
defaults write NSGlobalDomain KeyRepeat -int 1

# 在桌面上显示外置硬盘和可移动媒体。
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# 将屏幕左下角触发角设置为运行屏幕保护程序。
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0

# 清空 dock 栏，只保留 邮件、设置
defaults write com.apple.dock persistent-apps -array
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/System/Applications/Mail.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/System/Applications/System Settings.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'

# 设置 dock 栏 大小为 25
defaults write com.apple.dock tilesize -int 25

# 开启 自动隐藏和显示程序坞
defaults write com.apple.dock autohide -bool true

# finder 设置 开启 显示所有文件扩展名
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# 路径栏显示完整路径
defaults write com.apple.finder ShowPathbar -bool true

# 重启 Dock 与 Finder 使上述所有配置生效
killall Dock
killall Finder
