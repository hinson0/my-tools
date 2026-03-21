# Claude Code Session Resume 行为

> 当通过 `claude --resume` 或 `claude --continue` 恢复会话时，Claude Code 会重新加载哪些内容。

## 会恢复/重新加载的内容

### 1. 完整对话历史

- 之前会话中的所有消息、工具调用结果和交互记录都会恢复到上下文窗口中
- 使用相同的 session ID，新消息追加到已有的对话文件中
- 从上次离开的地方继续
- 如果对话接近上下文窗口上限，系统会自动压缩早期消息（不会丢失，只是被摘要化）

### 2. 指令和内存文件

| 内容 | 说明 |
|------|------|
| CLAUDE.md / .CLAUDE.local.md | 项目级、用户级、组织级全部**重新读取最新版本**（exit 前的修改会生效） |
| 自动记忆 (MEMORY.md) | 前 200 行加载到上下文，详细的主题文件按需加载 |
| `.claude/rules/` 规则 | 根据当前操作的文件路径条件加载 |

> **实用场景**：如果在 exit 前修改了 `.CLAUDE.local.md`（如添加新规则），resume 后会读到最新内容。

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

### 4. Plugin Hooks

- 注册了 SessionStart 的 Plugin hooks 也会在 resume 时重新执行
- 例如 Vercel plugin 的 `inject-claude-md.mjs` 会在每次 resume 时重新注入生态知识图谱
- Plugin 的 PreToolUse hooks（如 skill 自动注入）会在后续工具调用时正常触发

## 不会保留的内容

| 内容 | 说明 |
|------|------|
| 会话级权限 | 之前批准的工具使用权限需要重新批准（安全机制） |
| PreToolUse skill 注入的去重状态 | 部分 plugin 按 session 去重，resume 后可能重新注入已注入过的 skill |

## Resume vs 全新启动的区别

| 方面 | 全新启动 (`startup`) | Resume (`resume`) |
|------|---------------------|-------------------|
| 对话历史 | 空 | 完整恢复 |
| CLAUDE.md | 加载 | 重新加载（读取最新版本） |
| MEMORY.md | 加载 | 重新加载 |
| SessionStart hooks | 触发 (source=startup) | 触发 (source=resume) |
| Plugin hooks | 触发 | 重新触发 |
| 工具权限 | 需批准 | 需重新批准 |
| 上下文压缩 | 无 | 长对话可能触发自动压缩 |

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
