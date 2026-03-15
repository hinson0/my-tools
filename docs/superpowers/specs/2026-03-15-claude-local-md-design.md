# CLAUDE.local.md 设计规格

## 概述

创建一个可复用的 `CLAUDE.local.md` 文件，存放在 my-tools 仓库（`~/my-tools`）的 `claude-code/.CLAUDE.local.md`，通过符号链接分发到各个项目，实现「一处维护、全局生效」的个人 Claude Code 行为配置。

## 目标

- 定义 Claude Code 的语言行为规则（回复语言、thinking 语言、Git 语言）
- 定义工作路径规则（Plan 文件位置、Worktree 目录）
- 文件自身存放在 my-tools 仓库中，通过 `ln -s` 链接到其他项目使用

## 设计决策

### 纯增量方案

只包含全局规则（`~/.claude/CLAUDE.md` 和 `~/.claude/rules/`）中**没有覆盖到**的内容，避免重复。用户将同步删除以下全局配置：

- `~/.claude/rules/common/language.md`（语言规则迁移至此文件）
- `~/.claude/CLAUDE.md` 中的 Plan 路径规则（由此文件覆盖）

### Plan 路径变更说明

Plan 文件从全局集中路径（`~/.claude/plans/<project-name>/`）改为项目内路径（`.claude/plans/`）。原因：将 Claude 产物（plans、worktrees）统一归入项目的 `.claude/` 目录下，使项目结构自包含，且与 worktree 的组织方式保持一致。

### Worktree 规则说明

`.claude/worktrees/` 规则是对 Claude 行为的指令约束（告诉 Claude 在哪里创建 worktree），而非 Claude Code 的原生配置项。

### 文件路径

源文件完整路径：`~/my-tools/claude-code/.CLAUDE.local.md`

使用方式：

```bash
ln -s ~/my-tools/claude-code/.CLAUDE.local.md ~/other-project/CLAUDE.local.md
```

## 文件内容

### 第一段：语言规则

| 规则 | 说明 |
|------|------|
| 回复语言 | 全程简体中文，包括 thinking 过程和代码注释说明文字 |
| 代码标识符 | 保持原文 |
| Git 语言 | 优先按项目的 `CLAUDE.md` 中指定的语言规则，否则默认英文 |
| Rules/Skills 文件 | 必须使用简体中文编写，技术术语保持原文 |

### 第二段：工作路径

| 规则 | 路径 |
|------|------|
| Plan Mode 文件 | `.claude/plans/YYYY_MM_DD_HH_mm-<name>.md`（项目内） |
| superpowers:writing-plans | `docs/superpowers/plans/`（不受影响） |
| Worktree 目录 | `.claude/worktrees/`（项目内） |

### 完整文件模板

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

## 范围外

- 不包含编码规范（依赖全局 `coding-style.md`）
- 不包含项目特定上下文（此文件是跨项目复用的）
- 不包含行为指引（如修改前确认等）
