# 根目录 README 设计文档

## 背景

仓库 `hinson0/my-tools` 从 `vimrc` 重组而来，目前包含 `vim-config` 和 `claude-code` 两个工具模块。根目录缺少 README，需要一个简洁的索引页。

## 目标

- 在根目录创建 `README.md`（英文）和 `README.zh-CN.md`（中文）
- 作为索引页，列出各工具模块并链接到各自目录
- 包含添加新工具的简要约定

## 设计

### 文件

| 文件 | 语言 | 说明 |
|------|------|------|
| `README.md` | 英文 | GitHub 默认展示 |
| `README.zh-CN.md` | 中文 | 中文版本 |

### 结构

两份文件结构相同，仅语言不同：

1. **标题 + 语言切换** — `# my-tools` + 语言切换链接。`README.md` 链接到 `./README.zh-CN.md`，`README.zh-CN.md` 链接到 `./README.md`
2. **一句话介绍** — 说明这是个人工具/配置集合仓库
3. **工具列表** — 表格形式，每行：工具名（链接到目录）、简述。按字母顺序排列
4. **添加新工具约定** — 编号列表，三条规则：
   1. 创建独立目录
   2. 添加双语 README（`README.md` + `README.zh-CN.md`）
   3. 在根 README 的工具列表中注册（按字母顺序插入）

### 工具列表内容

| 工具 | 描述（英文） | 描述（中文） |
|------|-------------|-------------|
| [vim-config](./vim-config/) | Minimal Vim configuration | 精简 Vim 配置 |
| [claude-code](./claude-code/) | Reusable CLAUDE.local.md for cross-project symlink | 可复用的 CLAUDE.local.md，通过符号链接跨项目共享 |

### 内容规模

每份文件约 30-40 行，保持轻量索引风格。

## 备注

- `claude-code/` 目录目前没有自己的 README，工具列表链接指向目录列表页（GitHub 会展示文件列表）。后续可按需补充
- 工具列表链接统一指向目录（`./tool-name/`），而非特定文件

## 范围外

- 不包含全局安装脚本
- 不包含贡献指南（个人仓库）
- 不包含 License 声明（个人工具仓库）
- 不包含各工具的详细使用说明（由各自 README 负责）
