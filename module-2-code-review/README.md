# Module 2 - Agentic Security Code Review

## Key Concept

A single-pass code review misses things. This module uses an 8-agent pipeline where each agent has a specialist role, and each agent's output feeds the next. The result is a structured security assessment that moves from architecture analysis through exploitation scenarios.

## The Agent Pipeline

```
ARCHITECT → MAPPER → ANALYST → HUNTER → RISK ANALYST → FIXER → VALIDATOR → ATTACKER
```

| Agent | Role | Output |
|-------|------|--------|
| Architect | Architecture & threat model | Trust boundaries, security assumptions |
| Mapper | Attack surface mapping | Entry point inventory table |
| Analyst | Data flow & code path analysis | Step-by-step traces with security observations |
| Hunter | Vulnerability identification | Exploitable findings with file/line/function |
| Risk Analyst | Severity & impact | CVSS v3.1 scoring table |
| Fixer | Remediation | Vulnerable code + secure replacement |
| Validator | False positive check | High-confidence findings only |
| Attacker | Adversarial simulation | Step-by-step exploitation with payloads |

## Instructions

1. Navigate to any repository you want to review
2. Launch Claude Code: `claude`
3. Paste the prompt from [`prompt.md`](prompt.md)
4. Review the generated report critically — Claude can miss context or misclassify severity

## Files

- [`prompt.md`](prompt.md) - The full 8-agent code review prompt
