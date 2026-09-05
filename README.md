# holman 的 dotfiles

**[English README](README.en.md)**

dotfiles 是你个性化自己系统的方式，而这些是我的。

我受够了长长的 alias 文件和四处散落的配置（这在其他 dotfiles 项目里
也极其常见）。因此这个项目更加以「主题」为中心。我意识到可以把很多
东西按主要使用领域（Ruby、git、系统库等等）拆分开来，于是项目就按
这个思路组织了。

如果你对这背后的理念感兴趣，可以[读一读我关于这个话题的文章]
(http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/)。

## 主题化

一切都围绕主题领域构建。如果你想在 fork 出来的 dotfiles 里新增一个
领域——比如「Java」——只需添加一个 `java` 目录并把文件放进去。任何
以 `.zsh` 为扩展名的文件都会被自动加载进你的 shell。任何以 `.symlink`
为扩展名的文件，在你运行 `script/bootstrap` 时都会被去掉扩展名后
软链接到 `$HOME`。

## 里面有什么

很多东西。说真的，非常多。在上面的文件浏览器里翻一翻，看看哪些组件
适合你。[Fork 它](https://github.com/holman/dotfiles/fork)，删掉你用
不到的，在你用得上的基础上继续构建。

## 组件

目录结构里有几个特殊文件。

- **bin/**：`bin/` 里的任何东西都会被加入你的 `$PATH`，在任何地方
  都可用。
- **topic/\*.zsh**：任何以 `.zsh` 结尾的文件都会被加载进你的环境。
- **topic/path.zsh**：任何名为 `path.zsh` 的文件会最先加载，用于
  设置 `$PATH` 之类的内容。
- **topic/completion.zsh**：任何名为 `completion.zsh` 的文件会最后
  加载，用于设置自动补全。
- **topic/install.sh**：任何名为 `install.sh` 的文件会在你运行
  `script/install` 时执行。为了避免被自动加载，它的扩展名是 `.sh`
  而不是 `.zsh`。
- **topic/\*.symlink**：任何以 `*.symlink` 结尾的文件都会被软链接到
  你的 `$HOME`。这样你可以把这些文件纳入版本管理，同时让它们在你的
  主目录里自动生效。运行 `script/bootstrap` 时会建立这些软链接。
- **~/.localrc**：把环境变量和密钥放在这里——例如 `OPENAI_API_KEY`、
  `ANTHROPIC_API_KEY`、`GEMINI_API_KEY` 等 AI API 密钥。它由
  `zsh/zshrc.symlink` 在 shell 启动时加载，且位于本仓库之外，因此
  可以保持私密。

## 安装

运行以下命令：

```sh
git clone https://github.com/holman/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
```

这会把 `.dotfiles` 中相应的文件软链接到你的主目录。所有配置都在
`~/.dotfiles` 中完成和调整。

你首先会想改的文件是 `zsh/zshrc.symlink`，它设置了一些在你自己机器
上会有所不同的路径。

`dot` 是一个简单的脚本，用来安装一些依赖、设置合理的 macOS 默认
配置等等。你可以调整这个脚本，并时不时运行一下 `dot`，让你的环境
保持新鲜和最新。这个脚本在 `bin/` 目录里。

## 问题反馈

我希望这个项目对所有人都可用；也就是说，你 clone 下来之后，即使你
没有安装 `rbenv` 之类的依赖，它也应该能正常工作。话虽如此，我确实
把它当作_我自己的_ dotfiles 在用，所以如果我忘了对某个依赖做检查，
很可能会弄坏一些东西。

如果你刚接触这个项目并遇到了任何阻碍，请在本仓库[提交 issue]
(https://github.com/holman/dotfiles/issues)，我很乐意帮你修复！

## 致谢

我曾经 fork 了 [Ryan Bates](http://github.com/ryanb) 出色的
[dotfiles](http://github.com/ryanb/dotfiles) 用了好几年，直到我的
修改和调整积累到一定程度，促使我最终打造了自己的版本。Ryan 的
dotfiles 是入门 bash 定制的捷径，后来也让我顺利转向了 zsh。这些
dotfiles 中相当一部分代码源自或受启发于 Ryan 的原始项目。
