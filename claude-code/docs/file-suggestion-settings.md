# fileSuggestion 文件建议设置

## 简单理解

当你在 Claude Code 中输入 `@` 引用文件时，会弹出文件路径自动补全列表。默认情况下它遍历文件系统来生成建议，但**大型 monorepo** 可能很慢。`fileSuggestion` 允许你用**自定义脚本**替换默认的文件搜索逻辑。

## 工作流程

```
你输入 @src/comp → Claude Code 调用你的脚本，传入 {"query": "src/comp"}
                 → 脚本返回匹配的文件路径列表
                 → Claude Code 展示为自动补全选项
```

## Demo

### 1. 配置 `settings.json`

```json
{
  "fileSuggestion": {
    "type": "command",
    "command": "~/.claude/file-suggestion.sh"
  }
}
```

### 2. 编写脚本 `~/.claude/file-suggestion.sh`

```bash
#!/bin/bash
# 从 stdin 读取 JSON，提取 query 字段
query=$(cat | jq -r '.query')

# 用 fd（或 find）做模糊搜索，最多返回 15 条
fd --type f "$query" "$CLAUDE_PROJECT_DIR" \
  --exclude node_modules \
  --exclude .git \
  | head -15
```

### 3. 赋予执行权限

```bash
chmod +x ~/.claude/file-suggestion.sh
```

之后你在 Claude Code 里输入 `@comp`，脚本就会用 `fd` 搜索含 "comp" 的文件并返回结果列表。

## 备注

- **适用场景**：超大仓库（几万+文件）默认遍历太慢时，可以用预建索引（如 `locate`、自定义 sqlite 索引）来加速
- 脚本通过 **stdin 接收 JSON**（`{"query": "xxx"}`），通过 **stdout 输出文件路径**（每行一个），最多显示 15 条
- 脚本可以访问 `CLAUDE_PROJECT_DIR` 等环境变量，和 hooks 共享同一套环境
- 对于普通项目（几千文件以内），默认的内置文件遍历已经足够快，不需要配置这个
