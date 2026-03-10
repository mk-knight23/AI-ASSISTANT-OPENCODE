# Getting Started with Opencode

## What is Opencode?

Opencode is an open-source terminal AI coding agent with multi-provider support. Free tier available via Nvidia Build.

---

## Install

```bash
# npm (recommended)
npm install -g opencode-ai

# Verify
opencode --version
```

---

## Quick Start (5 minutes)

```bash
# 1. Navigate to project
cd my-project

# 2. Start interactive TUI
opencode

# 3. Or direct task
opencode "Explain this codebase and list main components"
```

---

## Set Up Free Tier (Zero Cost)

```bash
# 1. Create account at build.nvidia.com
# 2. Copy your free API key

# 3. Configure
opencode config set provider nvidia
opencode config set nvidia.api_key nvapi-YOUR-KEY

# 4. Set free model
opencode config set nvidia.model kimi-k2-5

# 5. Test it
opencode "Say hello and list what you can help with"
```

**Cost: $0/month** for most development work.

---

## Full Config File

```bash
cat > ~/.config/opencode/config.toml << 'EOF'
[default]
provider = "nvidia"
model = "kimi-k2-5"
max_tokens = 128000
show_tool_calls = true

[providers.anthropic]
api_key = "sk-ant-..."
model = "claude-sonnet-4-6"

[providers.nvidia]
api_key = "nvapi-..."
model = "kimi-k2-5"

[providers.openrouter]
api_key = "sk-or-..."
model = "google/gemini-flash-1.5"

[providers.ollama]
base_url = "http://localhost:11434"
model = "codellama:latest"
EOF
```

---

## Switch Providers

```bash
# Free (Nvidia Build)
opencode --provider nvidia "Implement the feature"

# Best quality (Anthropic Opus)
opencode --provider anthropic --model claude-opus-4-6 "Plan architecture"

# Fully offline (Ollama)
opencode --provider ollama "Quick review"
```

---

## PLAN → EXECUTE Workflow

Best cost/quality strategy:

```bash
# Step 1: Plan with Opus (once, ~$0.10)
opencode --provider anthropic --model claude-opus-4-6 \
"Create detailed implementation plan for JWT auth in Express.
Save to PLAN.md"

# Step 2: Execute with free tier
opencode --provider nvidia \
"Read PLAN.md and implement every step"
```

**Result:** Expert planning, $0 execution.

---

## LSP Auto-Loading

Opencode detects your project and loads the right language server:

```bash
# TypeScript project → auto-loads tsserver, eslint-lsp
# Python project → auto-loads pylsp, ruff-lsp
# Go project → auto-loads gopls
# Just open the project and run opencode
```

---

## Common Patterns

```bash
# Debug from logs
cat app.log | opencode "Find root cause, suggest fix"

# Review diff
git diff | opencode "Review for bugs and security issues"

# Generate commit message
git diff --cached | opencode "Write conventional commit message"

# Generate tests
opencode "Write comprehensive tests for src/auth/login.ts"

# SQL to TypeScript types
cat schema.sql | opencode "Generate TypeScript interfaces"
```

---

## Project Instructions

```bash
mkdir .opencode
cat > .opencode/instructions.md << 'EOF'
# Project: My App

## Stack: Python 3.12 + FastAPI + SQLAlchemy

## Standards:
- Type hints everywhere
- Async by default
- Tests must pass before marking task complete

## Commands:
- uvicorn main:app --reload → dev server
- pytest → tests
EOF
```

---

## TUI Shortcuts

| Key | Action |
|-----|--------|
| `Enter` | Send message |
| `Ctrl+C` | Cancel task |
| `Ctrl+D` | Exit |
| `↑/↓` | History |
| `Ctrl+L` | Clear screen |

---

## Next Steps

- Read [FEATURES.md](FEATURES.md) — all features
- Read [WORKFLOWS.md](WORKFLOWS.md) — real workflows
- Try free Nvidia Build tier today
