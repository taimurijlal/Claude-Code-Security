# Module 6 - The Power of Sub-Agents

## Key Concept

When Claude Code encounters a complex task with multiple independent parts, it can spawn specialised sub-agents that work in parallel. Each sub-agent gets its own context window, its own instructions, and its own scope. The main agent acts as a coordinator: it breaks the task down, dispatches sub-agents, collects their results, and synthesises a unified output.

For security teams, sub-agents model something familiar: a coordinated assessment team. Just as you'd assign one analyst to dependency auditing, another to configuration review, and a third to code analysis, sub-agents let you decompose a security assessment into specialist roles that work in parallel.

## Architecture

```
                     ┌──────────────────────────┐
                     │   Coordinator Agent      │
                     │     (Main Session)       │
                     └──────────┬───────────────┘
                                │
        ┌──────────────┬────────┼────────┬──────────────┐
        │              │        │        │              │
┌──────────────┐ ┌──────────────┐ ┌──────────────┐ ┌──────────────┐
│ Code         │ │ Secrets      │ │ Dependencies │ │ Config       │
│ Analysis     │ │ Scanner      │ │ Auditor      │ │ Reviewer     │
│ Agent        │ │ Agent        │ │ Agent        │ │ Agent        │
└──────┬───────┘ └──────┬───────┘ └──────┬───────┘ └──────┬───────┘
       │                │                │                │
       └──────────┬─────┴─────┬──────────┴─────┬──────────┘
                  │           │                │
                  └───────────┴────────────────┘
                              │
                   ┌────────────────────────┐
                   │    Unified Report      │
                   └────────────────────────┘
```

## When to Use Sub-Agents

| Scenario | Why Sub-Agents Work | Example |
|----------|-------------------|---------|
| Multiple independent analysis domains | Each domain can be investigated without knowing the other's findings | Secrets scan + dependency audit + config review + code analysis |
| Same analysis across many targets | Each target is independent | Scan 5 microservices simultaneously |
| Research + implementation in parallel | One agent researches while another implements known-safe changes | Agent 1 investigates CVEs; Agent 2 updates packages |
| Large codebase exploration | Different parts can be read simultaneously | Agent 1 maps frontend; Agent 2 maps API; Agent 3 maps database |
| Generating multiple report sections | Report sections don't depend on each other | Executive summary agent, technical findings agent, remediation agent |

## The Dependency Test

Before deciding to use sub-agents, ask:

1. **Can I describe each subtask without referencing another subtask's result?** If yes, sub-agents are appropriate.
2. **Do any subtasks write to the same files?** If yes, do not parallelise those subtasks.
3. **Will findings from one subtask change the priority of another?** If yes, consider a phased approach.
4. **Is the task complex enough to justify the overhead?** Sub-agents use ~3-4x the tokens. If a single agent can finish in under 2 minutes, skip sub-agents.

## Instructions

1. Navigate to any repository you want to assess
2. Launch Claude Code: `claude`
3. Paste the prompt from [`prompt.md`](prompt.md)
4. Watch Claude spawn parallel agents and synthesise the unified report

## Files

- [`prompt.md`](prompt.md) - The full parallel security assessment prompt
