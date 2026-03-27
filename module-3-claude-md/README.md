# Module 3 - CLAUDE.md

## Key Concept

CLAUDE.md is a Markdown file placed in the root of your repository that Claude Code reads automatically at the start of every session. It provides persistent project context, behavioural rules, and domain-specific knowledge. Think of it as onboarding documentation for your AI teammate — write it once, and every future session inherits everything you have defined.

## What Goes in CLAUDE.md

- **Project overview** — what the system does, who it serves
- **Security classification** — compliance requirements (PCI DSS, OWASP ASVS, SOC 2, etc.)
- **Mandatory security rules** — hard constraints Claude must follow
- **Banned patterns** — code patterns that must never appear
- **Approved libraries** — vetted dependencies for security-critical functions
- **Verification commands** — what Claude must run before completing any task
- **Pre-completion checklist** — final checks before marking work as done

## Where to Place It

```
project-root/
├── CLAUDE.md          ← Claude reads this automatically
├── package.json
├── src/
└── ...
```

CLAUDE.md can also be placed in subdirectories for module-specific rules, or in `~/.claude/CLAUDE.md` for global rules that apply to all projects.

## Instructions

1. Review the example in [`examples/CLAUDE.md`](examples/CLAUDE.md)
2. Copy it to the root of your project
3. Customise it for your project's technology stack, compliance requirements, and security policies
4. Launch Claude Code — it will load the file automatically

## Files

- [`examples/CLAUDE.md`](examples/CLAUDE.md) - Sample CLAUDE.md for a Node.js banking API
