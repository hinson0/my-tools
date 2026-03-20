# Thinking Mode

## 概述

Thinking Mode（扩展思考）是 Claude 在回复前进行深度内部推理的能力。

| 状态 | 行为 |
|------|------|
| `true` | Claude 会在回复前花额外 token 做深度推理（最多 ~32K token），适合复杂任务 |
| `false` | 关闭扩展思考，响应更快，但对复杂推理任务可能质量下降 |

## 切换方式

- **快捷键**：`Option+T`（macOS） / `Alt+T`（Windows/Linux）
- **交互菜单**：`/config` → Thinking mode
- **配置文件**：在 `~/.claude/settings.json` 中设置 `alwaysThinkingEnabled`
- **环境变量**：`export MAX_THINKING_TOKENS=10000` 控制思考预算上限
- **查看思考过程**：`Ctrl+O` 开启 verbose 模式

## 中途切换的警告

> Changing thinking mode mid-conversation will increase latency and may reduce quality.

在对话进行中切换 thinking mode 会有副作用：

1. **延迟增加**：模型需要重新调整推理策略，首次响应会变慢
2. **质量可能下降**：对话前半段没有思考链，后半段突然开启（或反之），上下文的连贯性会受影响

**最佳实践**：在对话开始前就决定好是否开启 thinking mode，而不是中途切换。
