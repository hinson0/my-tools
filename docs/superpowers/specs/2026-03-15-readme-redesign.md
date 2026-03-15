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

## 文件结构

每个 README 包含三个部分：

### 1. 标题 + 语言切换

顶部放语言切换链接，格式：`🌐 English | 简体中文`

当前语言为纯文本，其他语言为链接。

### 2. 功能列表

基于当前 `.vimrc` 的 6 项功能：

| 功能 | 对应配置 |
|------|----------|
| 行号 + 相对行号 | `number`, `relativenumber` |
| 2 空格缩进 | `tabstop=2`, `shiftwidth=2`, `expandtab` |
| 智能搜索 + 高亮 | `ignorecase`, `smartcase`, `incsearch`, `hlsearch` |
| 撤销持久化 | `undofile`, `undodir` |
| 系统剪贴板互通 | `clipboard=unnamedplus` |
| JSON 文件支持 | `autocmd FileType json ...` |

### 3. 安装方式

4 行 bash 命令：备份、克隆、软链接、创建 undo 目录。

备注说明 `~/.vim/undo` 目录的用途。

GitHub 仓库地址：`https://github.com/hinson0/vimrc.git`

## 不包含

- 配置项详细说明
- Vim 使用技巧
- 插件管理
- 截图/GIF 演示
