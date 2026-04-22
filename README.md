# [Claude Code for Cybersecurity Professionals](https://www.udemy.com/course/mastering-claude-code-for-cybersecurity-professionals)

A hands-on course teaching cybersecurity professionals how to leverage Claude Code as an agentic AI platform for security activities. Progress from basic terminal interactions to building fully automated security workflows powered by AI sub-agents, MCP integrations, and custom security skills.

## Course Modules

| Module | Topic | Description |
|--------|-------|-------------|
| 1 | [Portfolio Build](module-1-portfolio/) | Use Claude Code as an agentic system to build a complete project from a single prompt |
| 2 | [Agentic Code Review](module-2-code-review/) | Multi-agent security review with OWASP-aligned vulnerability analysis |
| 3 | [CLAUDE.md](module-3-claude-md/) | Persistent project security policy that loads automatically every session |
| 4 | [Skills](module-4-skills/) | Modular, reusable security procedures Claude loads on demand |
| 5 | [MCP Servers](module-5-mcp/) | Connect Claude to live security tools via the Model Context Protocol |
| 6 | [Sub-Agents](module-6-sub-agents/) | Parallel security assessments using coordinated specialist agents |
| 7 | [Hooks](module-7-hooks/) | Hard enforcement gates that block dangerous actions automatically |

## The Complete Security Stack

```
Layer          Module         Function              Analogy
─────────────────────────────────────────────────────────────
Policy         CLAUDE.md      Rules & constraints    Security policy
Procedure      Skills         Methodologies          SOPs
Connectivity   MCP Servers    Live tool access        API integrations
Parallelism    Sub-Agents     Team coordination      Assessment team
Enforcement    Hooks          Automated gates        CI/CD gates
```

## Prerequisites

- [Claude Code CLI](https://docs.anthropic.com/en/docs/claude-code) installed and authenticated
- Basic familiarity with the terminal
- A code editor (VS Code recommended)

## How to Use This Repo

Each module folder contains:
- A `README.md` explaining the concept and how it fits the security stack
- Ready-to-use prompt files you can paste or pipe into Claude Code
- Sample configuration files you can copy into your own projects

Work through the modules in order. Each builds on the previous one.
