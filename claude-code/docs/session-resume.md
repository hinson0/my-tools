# Claude Code Session Resume 行为

> 当通过 `claude --resume` 或 `claude --continue` 恢复会话时，Claude Code 会重新加载哪些内容。

## 会恢复/重新加载的内容

### 1. 完整对话历史

- 之前会话中的所有消息、工具调用结果和交互记录都会恢复到上下文窗口中
- 使用相同的 session ID，新消息追加到已有的对话文件中
- 从上次离开的地方继续

### 2. 指令和内存文件

| 内容 | 说明 |
|------|------|
| CLAUDE.md 文件 | 项目级、用户级、组织级的所有 CLAUDE.md 全部重新加载 |
| 自动记忆 (MEMORY.md) | 前 200 行加载到上下文，详细的主题文件按需加载 |
| `.claude/rules/` 规则 | 根据当前操作的文件路径条件加载 |

### 3. SessionStart Hooks

- `SessionStart` 钩子以 `source: "resume"` 触发执行
- 与 `startup`、`clear`、`compact` 并列为四种 SessionStart 事件类型
- 可通过 `matcher` 字段区分不同事件类型，执行不同逻辑：

```json
{
  "matcher": "resume",
  "hooks": [{ "type": "command", "command": "echo 'Resumed!'" }]
}
```

- Hook 可通过 stdout 注入动态上下文
- 可通过 `CLAUDE_ENV_FILE` 设置整个会话的环境变量

## 不会保留的内容

### 会话级权限 (Session-scoped Permissions)

- 之前会话中批准的工具使用权限**不会**保留
- Resume 后需要重新批准（这是安全机制）

## Resume vs 全新启动的区别

| 方面 | 全新启动 (`startup`) | Resume (`resume`) |
|------|---------------------|-------------------|
| 对话历史 | 空 | 完整恢复 |
| CLAUDE.md | 加载 | 重新加载 |
| MEMORY.md | 加载 | 重新加载 |
| SessionStart hooks | 触发 (source=startup) | 触发 (source=resume) |
| 工具权限 | 需批准 | 需重新批准 |

## 相关命令

```bash
# 恢复最近的会话
claude --resume

# 继续最近的会话（别名）
claude --continue

# 恢复指定 session
claude --resume <session-id>
```

## 参考文档

- [Resume previous conversations](https://code.claude.com/docs/en/common-workflows.md#resume-previous-conversations)
- [Resume or fork sessions](https://code.claude.com/docs/en/how-claude-code-works.md#resume-or-fork-sessions)
- [Memory loading](https://code.claude.com/docs/en/memory.md#how-claudemd-files-load)
- [SessionStart hook](https://code.claude.com/docs/en/hooks.md#sessionstart)
