# Module 5 - Model Context Protocol (MCP)

## Key Concept

The Model Context Protocol (MCP) is an open standard that defines a universal interface between AI agents and external tools — databases, scanners, APIs, SIEMs, and any other service that exposes structured functionality. Think of it as a USB specification for AI tools: you write a server once, and it works with Claude Code, Cursor, VS Code, Windsurf, and any other compliant client.

## MCP Architecture

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│  AI Host        │    │  MCP Server     │    │  External Tool  │
│  (Claude Code)  │────│  (Bridge)       │────│  (Snyk, Nmap,   │
│                 │ MCP│                 │ API│   ZAP, etc.)    │
└─────────────────┘    └─────────────────┘    └─────────────────┘

Host:   Your AI client (Claude Code, Cursor, etc.)
Server: Exposes tools, resources, and prompts via JSON-RPC
Tool:   The actual external system being accessed
```

## How MCP Connects to CLAUDE.md and Skills

The three modules form a complete security stack:

| Layer | Module | Controls | Example |
|-------|--------|----------|---------|
| Policy | CLAUDE.md | Rules and constraints | "Never hardcode secrets" |
| Procedure | Skills | Multi-step methodologies | "Run STRIDE threat model" |
| Connectivity | MCP Servers | Live tool access | "Scan deps with Snyk" |

## The Full Stack in Action

```
project-root/
├── CLAUDE.md                       # Security policy (Module 3)
│   └── Mandatory rules, banned patterns, compliance reqs
├── .claude/
│   ├── skills/
│   │   ├── stride-threat-model/    # STRIDE skill (Module 4)
│   │   │   └── SKILL.md
│   │   ├── security-audit/
│   │   │   └── SKILL.md
│   │   └── incident-response/
│   │       └── SKILL.md
│   └── mcp.json                    # MCP server config (this module)
│       └── snyk, nmap, cve-search
└── src/                            # Your actual code
```

## Example Workflow

1. **Developer starts Claude Code.** CLAUDE.md loads automatically. Claude now knows the security policy, banned patterns, and compliance requirements.
2. **Developer asks for a threat model.** The STRIDE skill activates. Claude follows the prescribed methodology, produces architecture diagrams and a threat table, and writes `threat.md`.
3. **Developer asks Claude to check for vulnerable dependencies.** The Snyk MCP server activates. Claude queries live vulnerability data, cross-references with the project's actual dependencies, and prioritises findings.
4. **Developer asks Claude to scan the deployment target.** The Nmap MCP server activates. Claude discovers services, detects versions, and chains to CVE-Search for vulnerability lookups.
5. **Claude generates code.** Every line is constrained by CLAUDE.md's security policy: parameterised queries, input validation, no hardcoded secrets, approved libraries only.

## Honest Limitations

- **MCP servers execute real commands.** An Nmap scan hits a real network. A Snyk scan sends data to Snyk's API. Understand what each server does before deploying it.
- **Results depend on the underlying tool.** If Nmap misses a service, Claude will miss it too. MCP is an interface, not an improvement on the tool's capabilities.
- **The AI can misinterpret results.** Claude may misclassify severity, suggest an incorrect fix, or miss context that changes the risk. All MCP-driven output requires human review.
- **Supply chain risk is real.** Community MCP servers are third-party code running on your machine. Vet them with the same rigour you apply to npm packages or Docker images.
- **Network and API costs.** Some MCP servers call paid APIs (Snyk Pro, Shodan, etc.). Understand the cost model before deploying at scale.
- **Not a replacement for professional pen testing.** MCP-driven scanning is a useful first pass and automation layer, but it does not replace methodical human-led penetration testing for high-value targets.
