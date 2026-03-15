# vimrc

🌐 English | [简体中文](./README.zh-CN.md)

A minimal, clean Vim configuration for daily use.

## Features

- Line numbers with relative numbering
- Cursor line highlighting
- 2-space indentation with smart indent
- Smart case-sensitive search with highlighting
- Persistent undo history
- System clipboard integration
- No line wrapping with scroll offset
- Syntax highlighting and filetype detection
- JSON file indent support

> Note: `clipboard=unnamedplus` requires Vim compiled with `+clipboard` (macOS users should install Vim via Homebrew).

## Installation

Back up your existing config and clone:

```bash
mv ~/.vimrc ~/.vimrc.bak
git clone https://github.com/hinson0/my-tools.git ~/my-tools
ln -s ~/my-tools/vim-config/.vimrc ~/.vimrc
mkdir -p ~/.vim/undo
```

> `~/.vim/undo` is required for persistent undo.
