# vimrc

🌐 [English](./README.md) | 简体中文

一份精简、干净的 Vim 日常配置。

## 功能

- 行号 + 相对行号
- 高亮当前行
- 2 空格缩进 + 智能缩进
- 智能大小写搜索 + 高亮
- 撤销历史持久化
- 系统剪贴板互通
- 不自动换行 + 滚动偏移
- 语法高亮 + 文件类型检测
- JSON 文件缩进支持

> 注：`clipboard=unnamedplus` 需要 Vim 编译时带 `+clipboard` 特性（macOS 用户建议使用 Homebrew 安装的 Vim）。

## 安装

备份已有配置后克隆：

```bash
mv ~/.vimrc ~/.vimrc.bak
git clone https://github.com/hinson0/my-tools.git ~/my-tools
ln -s ~/my-tools/vim-config/.vimrc ~/.vimrc
mkdir -p ~/.vim/undo
```

> `~/.vim/undo` 目录用于撤销历史持久化，需手动创建。
