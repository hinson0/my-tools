# 仓库重组实施计划

> **For agentic workers:** REQUIRED: Use superpowers:subagent-driven-development (if subagents available) or superpowers:executing-plans to implement this plan. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 将 `hinson0/vimrc` 仓库重组为 `hinson0/my-tools`，按工具类别分子目录组织。

**Architecture:** 用 `git mv` 将 Vim 相关文件移入 `vim-config/`，新建 `claude-code/` 目录，更新 README 中的安装路径，最后通过 `gh repo rename` 完成 GitHub 改名。

**Tech Stack:** Git, GitHub CLI (`gh`)

**Spec:** `docs/superpowers/specs/2026-03-15-repo-restructure-design.md`

---

## Chunk 1: 文件重组与提交

### Task 1: 移动 Vim 文件到 vim-config/

**Files:**
- Move: `.vimrc` → `vim-config/.vimrc`
- Move: `README.md` → `vim-config/README.md`
- Move: `README.zh-CN.md` → `vim-config/README.zh-CN.md`

- [ ] **Step 1: 创建目录并移动文件**

```bash
mkdir -p vim-config
git mv .vimrc vim-config/.vimrc
git mv README.md vim-config/README.md
git mv README.zh-CN.md vim-config/README.zh-CN.md
```

- [ ] **Step 2: 验证文件已移动**

```bash
ls vim-config/
```

Expected: `.vimrc  README.md  README.zh-CN.md`

---

### Task 2: 更新 README 安装命令

**Files:**
- Modify: `vim-config/README.md:26-28`
- Modify: `vim-config/README.zh-CN.md:26-28`

- [ ] **Step 1: 更新英文 README 安装命令**

在 `vim-config/README.md` 中，将安装命令从：

```bash
git clone https://github.com/hinson0/vimrc.git ~/vimrc
ln -s ~/vimrc/.vimrc ~/.vimrc
```

改为：

```bash
git clone https://github.com/hinson0/my-tools.git ~/my-tools
ln -s ~/my-tools/vim-config/.vimrc ~/.vimrc
```

- [ ] **Step 2: 更新中文 README 安装命令**

在 `vim-config/README.zh-CN.md` 中，做同样的替换：

```bash
git clone https://github.com/hinson0/vimrc.git ~/vimrc
ln -s ~/vimrc/.vimrc ~/.vimrc
```

改为：

```bash
git clone https://github.com/hinson0/my-tools.git ~/my-tools
ln -s ~/my-tools/vim-config/.vimrc ~/.vimrc
```

- [ ] **Step 3: 验证两个文件的安装命令已正确更新**

```bash
grep -A4 '```bash' vim-config/README.md
grep -A4 '```bash' vim-config/README.zh-CN.md
```

Expected: 两个文件都显示 `my-tools` 和 `vim-config/.vimrc` 路径。

---

### Task 3: 创建 claude-code 目录

**Files:**
- Create: `claude-code/.CLAUDE.local.md`

- [ ] **Step 1: 创建空占位文件**

```bash
mkdir -p claude-code
touch claude-code/.CLAUDE.local.md
```

- [ ] **Step 2: 验证文件存在**

```bash
ls -la claude-code/
```

Expected: 显示 `.CLAUDE.local.md`

---

### Task 4: 提交并推送

- [ ] **Step 1: 暂存所有变更**

```bash
git add vim-config/ claude-code/.CLAUDE.local.md
```

- [ ] **Step 2: 提交**

```bash
git commit -m "refactor: restructure repo into my-tools with vim-config and claude-code dirs"
```

- [ ] **Step 3: 推送到远程**

```bash
git push origin master
```

---

### Task 5: GitHub 仓库改名

- [ ] **Step 1: 改名**

```bash
gh repo rename my-tools
```

Expected: 提示确认，输入 `yes`。仓库 URL 变为 `github.com/hinson0/my-tools`。

- [ ] **Step 2: 更新本地 remote URL**

```bash
git remote set-url origin git@github.com:hinson0/my-tools.git
```

- [ ] **Step 3: 验证 remote URL**

```bash
git remote -v
```

Expected: `origin  git@github.com:hinson0/my-tools.git (fetch/push)`
