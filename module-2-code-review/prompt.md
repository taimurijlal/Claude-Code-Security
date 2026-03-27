# Agentic Security Code Review Prompt

Copy the prompt below into Claude Code while inside the repository you want to review.

---

```
You are an agentic security review system composed of multiple specialized sub-agents.

Your task is to perform a complete, high-confidence security review of this repository.

Each sub-agent must perform its role and then pass its output to the next agent.
Be precise, technical, and avoid generic statements.

---

### AGENT 1 — ARCHITECT (Architecture & Threat Model)

Analyse the repository and produce:

- High-level architecture (frontend, backend, APIs, database)
- Authentication and session management mechanisms
- External integrations
- Trust boundaries (where untrusted input crosses into the system)
- Sensitive assets (user data, tokens, admin functionality)

Output:
- Architecture summary
- Trust boundary explanation
- Key security assumptions

---

### AGENT 2 — MAPPER (Attack Surface Mapping)

Using the architecture:

Identify ALL entry points where untrusted input enters the system.

For each entry point, provide:
- Endpoint (URL/route)
- HTTP method
- Parameters (query, body, headers, cookies)
- File and function handling the request
- Initial data flow

Also include:
- Hidden inputs (headers, JWTs, file uploads, etc.)

Output as a structured table.

---

### AGENT 3 — ANALYST (Data Flow & Code Path Analysis)

Select the most critical entry points and trace full execution paths:

- Input → processing → database → response

For each step:
- Identify validation and sanitization (or lack of it)
- Identify authorization checks
- Highlight dangerous functions or insecure patterns
- Call out trust assumptions

Output:
- Step-by-step data flow trace per endpoint
- Security observations

---

### AGENT 4 — HUNTER (Vulnerability Identification)

Using the data flow analysis:

Identify REAL, exploitable vulnerabilities.

For each finding:
- Vulnerability type (OWASP Top 10 category)
- Exact file + function + line number
- Step-by-step exploit scenario
- Root cause
- Preconditions for exploitation

Focus on:
- Injection (SQL, NoSQL, command, template)
- Broken access control (IDOR, privilege escalation)
- Security misconfiguration
- Insecure deserialization
- Business logic flaws

DO NOT include generic or unverified issues.

---

### AGENT 5 — RISK ANALYST (Severity & Impact)

For each vulnerability:

Assign:
- CVSS v3.1 score
- Attack vector
- Attack complexity
- Privileges required
- User interaction
- Impact (C/I/A)

Also include:
- Business impact (e.g., account takeover, data exposure)
- Likelihood of exploitation

Output as a table.

---

### AGENT 6 — FIXER (Remediation)

For each vulnerability:

Provide:
1. Vulnerable code snippet
2. Explanation of why it is insecure
3. Secure fixed version of the code
4. Additional defensive controls

Ensure fixes align with framework best practices.

---

### AGENT 7 — VALIDATOR (False Positive & Confidence Check)

Re-evaluate all findings:

- Are they truly exploitable?
- Are there false positives?
- Are there existing mitigations?

Refine the list to only HIGH-CONFIDENCE vulnerabilities.

---

### AGENT 8 — ATTACKER (Adversarial Simulation)

Act as a real attacker.

For the top 1–2 vulnerabilities:
- Show step-by-step exploitation
- Provide payload examples
- Describe expected application responses
- Show potential attack chain

---

### FINAL OUTPUT FORMAT

Produce a structured report with sections:

1. Architecture Overview
2. Attack Surface
3. Data Flow Analysis
4. Confirmed Vulnerabilities
5. Risk Ratings
6. Remediation Plan
7. Validated Findings Only
8. Exploitation Scenarios

---

### IMPORTANT RULES

- Be specific (files, functions, line numbers)
- Do not hallucinate vulnerabilities
- Only include findings supported by code paths
- Prioritize depth over breadth
- Think like a senior AppSec engineer, not a scanner
```
