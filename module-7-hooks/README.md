# Module 7 - The Enforcement Gap

## Key Concept

You built a complete AI security stack: policy (CLAUDE.md), procedures (Skills), connectivity (MCP Servers), and parallelism (Sub-Agents). But all four layers share a fundamental limitation: **they rely on Claude to follow instructions voluntarily.**

CLAUDE.md says "never hardcode secrets." But what happens if Claude generates a file that accidentally contains one? Nothing. The file is written. The secret is in your repository. No alarm fires.

**CLAUDE.md tells Claude what not to do. Hooks prevent Claude from doing it.**

Hooks are automation triggers that execute shell commands before or after specific events in Claude Code's execution cycle. They transform Claude from a reactive assistant that follows guidelines into a proactive security engine with hard enforcement gates.

## Where Hooks Fit

| Layer | Module | Type | Enforcement |
|-------|--------|------|-------------|
| Policy | CLAUDE.md | Guidance | Claude follows rules voluntarily |
| Procedure | Skills | Methodology | Claude follows steps voluntarily |
| Connectivity | MCP Servers | Tool access | Controlled by server exposure |
| Parallelism | Sub-Agents | Scale | Coordinator manages output |
| **Enforcement** | **Hooks** | **Automated gates** | **Hard blocks, mandatory scans, audit logs** |

## The Event Lifecycle

```
  User Prompt
      │
      │ ← UserPromptSubmit hook (validate/enrich)
      ▼
  Claude Processes → decides to use a tool
      │
  ┌──────────────────────────────────────────┐
  │ PreToolUse Hook                          │
  │ → Can BLOCK the action (exit code 2)     │
  │ → Can MODIFY tool inputs                 │
  │ → Can ADD context for Claude             │
  └──────────────────────────────────────────┘
      │ (If allowed)
      ▼
  Tool Executes
      │
  ┌──────────────────────────────────────────┐
  │ PostToolUse Hook                         │
  │ → Can SCAN output for violations         │
  │ → Can BLOCK further processing           │
  │ → Can PROVIDE feedback to Claude         │
  └──────────────────────────────────────────┘
      │
      ▼
  Claude Continues (or Stop hook fires)
```

## The Three Hooks in This Module

### 1. Bash Firewall (`pre-bash-firewall.sh`)
Blocks dangerous shell commands before they execute: `rm -rf /`, `git push --force`, `chmod 777`, pipe-to-shell patterns, etc.

### 2. Path Guard (`pre-write-path-guard.sh`)
Prevents writes to protected files: `.env`, Terraform configs, CI/CD workflows, Kubernetes manifests, SSH keys.

### 3. Secret Scanner (`pre-write-secret-scan.sh`)
Scans content for hardcoded secrets (AWS keys, GCP keys, API tokens, passwords, private keys) before any file write or edit. Blocks the write if secrets are detected.

## Instructions

1. Copy the `.claude/hooks/` directory from this module into your project root
2. Make the scripts executable: `chmod +x .claude/hooks/*.sh`
3. Copy `settings.json` to your project's `.claude/` directory
4. Launch Claude Code — hooks are now active

## Testing the Hooks

Try asking Claude to:
- Run `rm -rf /` (Bash Firewall should block)
- Write to `.env` (Path Guard should block)
- Create a file containing `AKIA1234567890ABCDEF` (Secret Scanner should block)

## Honest Limitations

- **Hooks add latency.** Keep them fast and scope matchers tightly.
- **Command hooks are deterministic, not intelligent.** Regex catches known patterns but misses novel formats.
- **Hooks are not a security boundary.** They run in user context. An attacker with machine access could disable them.
- **Hook scripts can have bugs.** Test and code-review like any security-critical code.
- **Over-hooking kills productivity.** Hook only what you need to enforce.

## Files

- [`settings.json`](settings.json) - Hook configuration for Claude Code
- [`.claude/hooks/pre-bash-firewall.sh`](.claude/hooks/pre-bash-firewall.sh) - Dangerous command blocker
- [`.claude/hooks/pre-write-path-guard.sh`](.claude/hooks/pre-write-path-guard.sh) - Protected file path guard
- [`.claude/hooks/pre-write-secret-scan.sh`](.claude/hooks/pre-write-secret-scan.sh) - Secret detection scanner
