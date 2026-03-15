# 仓库重组设计文档

## 背景

当前仓库 `hinson0/vimrc` 仅包含 Vim 配置。用户希望将其扩展为个人工具集合仓库 `my-tools`，按工具类别分目录组织。

## 目标

- GitHub 仓库改名为 `hinson0/my-tools`
- 将 Vim 相关文件移入 `vim-config/` 子目录
- 新增 `claude-code/` 目录，包含空的 `.CLAUDE.local.md`
- `docs/` 保留在根目录不动

## 重组后目录结构

```
my-tools/
├── vim-config/
│   ├── .vimrc
│   ├── README.md
│   └── README.zh-CN.md
├── claude-code/
│   └── .CLAUDE.local.md
└── docs/
    └── superpowers/
```

## 实施顺序

采用"先重组本地，再改 GitHub 名"方案：

1. 创建 `vim-config/` 目录，用 `git mv` 移动 `.vimrc`、`README.md`、`README.zh-CN.md`
2. 创建 `claude-code/.CLAUDE.local.md`（空文件）
3. 提交并推送
4. 通过 `gh repo rename` 将 GitHub 仓库改名为 `my-tools`
5. 更新本地 remote URL

## 注意事项

- README 中的语言切换链接为相对路径，移入同一目录后无需修改
- README 中的 `git clone` 地址需更新为 `hinson0/my-tools`
- GitHub 会自动为旧仓库名设置 301 重定向
- 根目录暂不创建 README
