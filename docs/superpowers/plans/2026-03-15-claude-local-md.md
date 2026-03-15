# CLAUDE.local.md 实施计划

> **For agentic workers:** REQUIRED: Use superpowers:subagent-driven-development (if subagents available) or superpowers:executing-plans to implement this plan. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 创建可复用的 `CLAUDE.local.md` 个人行为配置文件，通过符号链接分发到各项目

**Architecture:** 在 `claude-code/.CLAUDE.local.md` 写入语言规则和工作路径规则，同步清理全局配置中的重复项

**Tech Stack:** Markdown, Git, Shell (symlink)

**Spec:** `docs/superpowers/specs/2026-03-15-claude-local-md-design.md`

---

## Chunk 1: 创建文件并清理全局配置

### Task 1: 创建 CLAUDE.local.md

**Files:**
- Create: `claude-code/.CLAUDE.local.md`

- [ ] **Step 1: 创建 claude-code 目录**

```bash
mkdir -p claude-code
```

- [ ] **Step 2: 写入 CLAUDE.local.md**

写入以下内容到 `claude-code/.CLAUDE.local.md`：

```markdown
# 语言

## 回复语言（必须遵守）

全程使用**简体中文**回复，包括：
- 所有解释、提问、总结
- 内部 thinking/reasoning 过程
- 代码注释中的说明文字

技术术语和代码标识符保持原文不变。

## Git 语言

Git 相关内容（commit message、PR title/body 等）遵循以下优先级：
1. 如果项目有明确的语言规则（如 CLAUDE.md 中指定），按项目规则
2. 否则默认使用英文

## 规则与技能文件

新增或修改 rules/skills 文件时，**必须使用简体中文编写**。
技术术语、代码标识符保持原文。

# 工作路径

## Plan Mode 文件位置

Claude Code Plan Mode 的计划文件保存在**当前项目目录内**：
`.claude/plans/YYYY_MM_DD_HH_mm-<name>.md`

注意：superpowers:writing-plans 遵循其自身默认路径（`docs/superpowers/plans/`），不受此规则影响。

## Worktree 工作目录

使用 git worktree 时，worktree 必须创建在项目的 `.claude/worktrees/` 目录下。
```

- [ ] **Step 3: 验证文件内容**

```bash
cat claude-code/.CLAUDE.local.md
```

预期：文件内容与上方模板一致。

- [ ] **Step 4: Commit**

```bash
git add claude-code/.CLAUDE.local.md
git commit -m "feat: add reusable CLAUDE.local.md for cross-project symlink"
```

### Task 2: 清理全局配置

**Files:**
- Delete: `~/.claude/rules/common/language.md`
- Modify: `~/.claude/CLAUDE.md`（删除 Plan Files Location 段落）

- [ ] **Step 1: 删除 language.md**

```bash
rm ~/.claude/rules/common/language.md
```

- [ ] **Step 2: 验证 language.md 已删除**

```bash
ls ~/.claude/rules/common/language.md
```

预期：`No such file or directory`

- [ ] **Step 3: 编辑 ~/.claude/CLAUDE.md**

删除以下内容（第 1-10 行的全部内容）：

```markdown
# Personal Claude Preferences

## Plan Files Location

**Claude Code plan mode only** (NOT superpowers:writing-plans):
Save plans to `~/.claude/plans/<project-name>/YYYY_MM_DD_HH_mm-<name>.md`

Example: `~/.claude/plans/storyverse-monorepo/2026_03_11_14_30-chatbot.md`

Note: superpowers:writing-plans follows its own default path (`docs/superpowers/plans/`).
```

删除后如果文件为空，可以直接删除该文件。

- [ ] **Step 4: 验证全局配置清理完成**

```bash
cat ~/.claude/CLAUDE.md 2>/dev/null || echo "文件已删除"
ls ~/.claude/rules/common/language.md 2>/dev/null || echo "language.md 已删除"
```

预期：两项均已清理。
