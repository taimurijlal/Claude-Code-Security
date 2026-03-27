# Module 4 - Claude Skills

## Key Concept

Skills are modular, reusable capability packages that Claude loads on demand. Each skill is a folder containing a Markdown instruction file (and optionally reference data files) that teaches Claude how to perform a specific type of task. Skills are persistent, composable, and shareable across projects and teams.

## How Skills Work

```
.claude/
└── skills/
    └── stride-threat-model/
        └── SKILL.md          ← Claude loads this when the skill is invoked
```

When you invoke a skill (e.g., `/stride-threat-model`), Claude reads the `SKILL.md` file and follows the methodology defined inside it. This means your security team can write procedures once and have every developer on the team use the same methodology automatically.

## Skills vs CLAUDE.md

| | CLAUDE.md | Skills |
|---|---|---|
| Loaded | Automatically every session | On demand when invoked |
| Purpose | Rules and constraints | Step-by-step methodologies |
| Scope | Entire project | Specific task type |
| Analogy | Security policy | Standard operating procedure |

## Instructions

1. Copy the `/skills/` directory from this module into the project path above. Copy it from raw and not preview
2. Launch Claude Code: `claude`
3. Invoke the skill: type `/stride-threat-model` in Claude Code
4. Claude will follow the STRIDE methodology and produce a `threat.md` file

