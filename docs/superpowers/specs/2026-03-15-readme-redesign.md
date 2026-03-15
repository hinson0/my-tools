# README 完善设计文档

## 背景

当前 `.vimrc` 已从 ~418 行精简至 ~38 行，全面重写为中文注释的简洁配置。但 `README.md` 仍为旧版内容，描述的快捷键映射已不存在，与实际配置完全不匹配。

## 目标

- 让 README 准确反映当前 `.vimrc` 配置
- 支持中英文双语（多文件方案）
- 轻量风格，一屏搞定
- 兼顾自用和分享

## 方案

采用**多文件分语言**方案：

- `README.md` — 英文版（GitHub 默认展示）
- `README.zh-CN.md` — 中文版
- 两个文件顶部互相链接跳转

旧 `README.md` 直接替换，旧内容通过 git 历史可追溯。

## 文件结构

每个 README 包含三个部分：

### 1. 标题 + 语言切换

顶部放语言切换链接，格式：`🌐 English | 简体中文`

当前语言为纯文本，其他语言为链接。

### 2. 功能列表

基于当前 `.vimrc` 的功能：

| 功能 | 对应配置 |
|------|----------|
| 行号 + 相对行号 | `number`, `relativenumber` |
| 高亮当前行 | `cursorline` |
| 2 空格缩进 + 智能缩进 | `tabstop=2`, `shiftwidth=2`, `expandtab`, `smartindent` |
| 智能搜索 + 高亮 | `ignorecase`, `smartcase`, `incsearch`, `hlsearch` |
| 撤销持久化 | `undofile`, `undodir` |
| 系统剪贴板互通 | `clipboard=unnamedplus` |
| 不自动换行 + 滚动偏移 | `nowrap`, `scrolloff=5` |
| 语法高亮 + 文件类型检测 | `syntax on`, `filetype plugin indent on` |
| JSON 文件缩进支持 | `autocmd FileType json ...` |

> 注：`clipboard=unnamedplus` 需要 Vim 编译时带 `+clipboard` 特性（macOS 用户建议使用 Homebrew 安装的 Vim）。

### 3. 安装方式

具体安装命令：

```bash
mv ~/.vimrc ~/.vimrc.bak        # 备份已有配置
git clone https://github.com/hinson0/vimrc.git ~/vimrc
ln -s ~/vimrc/.vimrc ~/.vimrc   # 软链接
mkdir -p ~/.vim/undo            # 撤销持久化所需目录
```

备注说明 `~/.vim/undo` 目录的用途。

## 不包含

- 配置项详细说明
- Vim 使用技巧
- 插件管理
- 截图/GIF 演示
