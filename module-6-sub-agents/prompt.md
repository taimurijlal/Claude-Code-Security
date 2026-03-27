# Parallel Security Assessment Prompt

Copy the prompt below into Claude Code while inside the repository you want to assess.

---

```
Perform a comprehensive security assessment of this repository.
Work in parallel with the following specialist agents:

1. CODE ANALYSIS AGENT
   Scope: Architecture and data flow mapping
   Tasks:
   - Map the repository structure and identify the technology stack
   - Identify all data entry points (routes, forms, API endpoints,
     file upload handlers)
   - Trace data flows from input to storage/output
   - Document trust boundaries between components
   Deliverable: Architecture summary with data flow diagram and
   entry point inventory

2. SECRETS SCANNER AGENT
   Scope: Credential and secret detection
   Tasks:
   - Scan all files for hardcoded API keys, passwords, tokens,
     private keys, and connection strings
   - Check Git history for previously committed secrets
   - Check environment variable usage for insecure defaults
   - Check .gitignore for missing sensitive file exclusions
   Deliverable: Table of findings with file, line number, secret
   type, and severity

3. DEPENDENCY AUDITOR AGENT
   Scope: Third-party dependency risk
   Tasks:
   - Analyse all package manifests (package.json, requirements.txt,
     etc.) for outdated or vulnerable dependencies
   - Flag deprecated packages and packages with no recent
     maintenance activity
   - Suggest safe upgrade paths for critical/high-severity issues
   Deliverable: Dependency risk table sorted by severity with
   upgrade recommendations

4. CONFIGURATION REVIEWER AGENT
   Scope: Infrastructure and deployment security
   Tasks:
   - Review cloud configuration files for overly permissive
     IAM roles, public S3 buckets, and missing encryption
   - Check for security headers, CORS configuration, and
     rate limiting settings
   Deliverable: Configuration findings table with file,
   misconfiguration, risk level, and remediation

SYNTHESIS INSTRUCTIONS:
After all agents complete, compile findings into a unified
security assessment report with:
- Executive summary (3-5 sentences, overall risk posture)
- Findings table sorted by severity (Critical > High > Medium > Low)
- Deduplication: if multiple agents found the same issue,
  consolidate into one finding
- Remediation prioritisation matrix (effort vs. impact)
- Top 5 immediate action items

Save the report as security-assessment.md
```
