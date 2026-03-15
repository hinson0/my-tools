# README 完善实施计划

> **For agentic workers:** REQUIRED: Use superpowers:subagent-driven-development (if subagents available) or superpowers:executing-plans to implement this plan. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 重写 README.md（英文）并新建 README.zh-CN.md（中文），使其准确反映当前精简后的 .vimrc 配置。

**Architecture:** 多文件分语言方案，两个 README 结构相同（标题+语言切换、功能列表、安装方式），顶部互相链接。旧 README.md 直接替换。

**Tech Stack:** Markdown

**Spec:** `docs/superpowers/specs/2026-03-15-readme-redesign.md`

---

## Chunk 1: README 文件

### Task 1: 重写 README.md（英文版）

**Files:**
- Modify: `README.md`

- [ ] **Step 1: 重写 README.md**

用以下内容替换 `README.md` 全部内容：

```markdown
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

\```bash
mv ~/.vimrc ~/.vimrc.bak
git clone https://github.com/hinson0/vimrc.git ~/vimrc
ln -s ~/vimrc/.vimrc ~/.vimrc
mkdir -p ~/.vim/undo
\```

> `~/.vim/undo` is required for persistent undo.
```

- [ ] **Step 2: 检查 README.md 渲染**

确认 Markdown 格式正确，链接指向 `./README.zh-CN.md`。

- [ ] **Step 3: 暂存变更**

```bash
git add README.md
```

---

### Task 2: 新建 README.zh-CN.md（中文版）

**Files:**
- Create: `README.zh-CN.md`

- [ ] **Step 1: 创建 README.zh-CN.md**

创建 `README.zh-CN.md`，内容如下：

```markdown
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

\```bash
mv ~/.vimrc ~/.vimrc.bak
git clone https://github.com/hinson0/vimrc.git ~/vimrc
ln -s ~/vimrc/.vimrc ~/.vimrc
mkdir -p ~/.vim/undo
\```

> `~/.vim/undo` 目录用于撤销历史持久化，需手动创建。
```

- [ ] **Step 2: 检查 README.zh-CN.md 渲染**

确认 Markdown 格式正确，链接指向 `./README.md`。

- [ ] **Step 3: 暂存变更**

```bash
git add README.zh-CN.md
```

---

### Task 3: 提交

- [ ] **Step 1: 提交所有变更**

```bash
git add README.md README.zh-CN.md
git commit -m "docs: rewrite README with bilingual support (EN + zh-CN)"
```
