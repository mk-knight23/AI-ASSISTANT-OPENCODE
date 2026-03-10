# Opencode — Workflows

Real-world workflows for terminal-native AI development.

---

## Workflow 1: PLAN → EXECUTE (Core Pattern)

The fundamental Opencode workflow for cost-optimal quality:

```bash
# Phase 1: PLAN with best model (run once)
opencode --provider anthropic --model claude-opus-4-6 \
"Analyze this codebase and create a detailed implementation plan for:
User authentication system with JWT, rate limiting, bcrypt.
Output to IMPLEMENTATION_PLAN.md with exact steps."

# Phase 2: EXECUTE with free tier (run many times)
opencode --provider nvidia --model kimi-k2-5 \
"Read IMPLEMENTATION_PLAN.md and implement every step exactly."
```

**Cost:** ~$0.10 for planning, **$0.00** for execution.

---

## Workflow 2: Log-Driven Debugging

```bash
cat /var/log/myapp/error.log | tail -100 | opencode \
"Analyze these errors:
1. Identify the critical pattern
2. Find root cause
3. Implement a fix
4. Write regression test"
```

---

## Workflow 3: Git-Powered Review

```bash
# Review diff before committing
git diff --cached | opencode \
"Review for: logic errors, security issues,
missing error handling. Rate each: CRITICAL/HIGH/MEDIUM/LOW"

# Auto-generate commit message
git diff --cached | opencode \
"Write a conventional commit message: type(scope): description"
```

---

## Workflow 4: Large Codebase Analysis

Kimi K2.5 has a 1M token context window (free via Nvidia Build):

```bash
find . -name "*.ts" -not -path "*/node_modules/*" | \
  xargs cat | \
  opencode --provider nvidia --model kimi-k2-5 \
"Analyze entire codebase:
1. Architectural patterns
2. Dead code
3. Missing error handling
4. Security concerns
Output as markdown report."
```

---

## Workflow 5: Schema to Types

```bash
cat schema.sql | opencode \
"Generate TypeScript interfaces + Zod schemas
for every table. Include nullable fields and FK relationships."
```

---

## Workflow 6: Parallel Agents

```bash
# Run multiple agents in parallel
opencode "Write unit tests for src/auth/" &
opencode "Write unit tests for src/payments/" &
opencode "Write unit tests for src/notifications/" &
wait
echo "All complete"
```

---

## Workflow 7: API Documentation

```bash
find src/routes -name "*.ts" | xargs cat | opencode \
"Generate OpenAPI 3.0 YAML from these route files.
Include: paths, methods, params, request/response schemas, auth.
Save as docs/openapi.yaml"
```

---

## Workflow 8: CI/CD Generation

```bash
opencode "Analyze this project and generate:
1. .github/workflows/ci.yml (test on PRs)
2. .github/workflows/deploy.yml (deploy on main)
3. .github/workflows/security.yml (weekly scan)

Use GitHub Actions with caching for speed."
```

---

## Workflow 9: Onboarding Guide

```bash
opencode "Read the codebase and generate:
1. ARCHITECTURE.md - system overview
2. SETUP.md - local development setup
3. CODEBASE_TOUR.md - key files and where things live
4. PATTERNS.md - coding conventions in use

Include actual file paths and code examples."
```

---

## Quick Combos

```bash
# Fix failing tests immediately
opencode "Fix: $(npm test 2>&1 | tail -20)"

# Explain any file
opencode "Explain: $(cat src/complex-module.ts)"

# Upgrade types in bulk
opencode "Add TypeScript strict types to all files in src/"
```
