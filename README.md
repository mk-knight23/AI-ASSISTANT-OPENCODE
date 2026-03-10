# Opencode — The Open Source AI Terminal Agent Showcase

![Opencode](https://img.shields.io/badge/Opencode-Open_Source-F59E0B?style=for-the-badge)
![Free](https://img.shields.io/badge/Free_Tier-Available-22C55E?style=for-the-badge)
![Terminal](https://img.shields.io/badge/Interface-Terminal_First-0F172A?style=for-the-badge)
![License](https://img.shields.io/badge/License-Open_Source-blue?style=for-the-badge)

> **"OpenCode + Nvidia Build: A highly capable, free agentic setup."** — Developer community, 2026

Opencode is the **open source AI coding agent** that runs in your terminal, IDE, or desktop — with LSP integration, multi-provider support, and a near-zero cost path using free model APIs. It's the hacker's choice for cost-effective AI-assisted development and the EXECUTE tool in the PLAN → EXECUTE pattern.

---

## Table of Contents

- [What is Opencode?](#what-is-opencode)
- [Why Open Source Matters](#why-open-source-matters)
- [Key Features](#key-features)
- [How I Use It](#how-i-use-it-personally)
- [Free Tier Guide](#free-tier-guide)
- [Provider Setup](#provider-setup)
- [Quick Start](#quick-start)
- [The PLAN → EXECUTE Pattern](#the-plan--execute-pattern)
- [Cost Optimization](#cost-optimization)
- [Workflows](#workflows)
- [Resources](#resources)

---

## What is Opencode?

Opencode is an open source agent that helps you write code in your terminal, IDE, or desktop. Key properties:

- **LSP-enabled**: automatically loads the right Language Server Protocols for the LLM to understand your code
- **Multi-provider**: bring your own model — Anthropic, OpenAI, Nvidia Build, OpenRouter, Moonshot, Minimax
- **Free tier**: run on completely free models (Kimi K2.5, Minimax m2.5 via Nvidia Build or OpenRouter)
- **Terminal-native**: no IDE required, works everywhere
- **Open source**: fork, contribute, self-host

---

## Why Open Source Matters

In 2026, most AI coding tools are closed-source proprietary platforms. Opencode is different:

1. **Transparency**: you can see exactly what it does with your code
2. **Privacy control**: self-host for maximum data sovereignty
3. **Provider freedom**: not locked into one AI company
4. **Cost control**: use free APIs, avoid per-seat licensing
5. **Community**: improvements from thousands of contributors
6. **Customization**: fork and modify for your specific needs

---

## Key Features

### 🔌 LSP Integration
```bash
# Opencode automatically detects your project type
# and loads the appropriate Language Server

# TypeScript → typescript-language-server
# Python → pylsp or pyright
# Go → gopls
# Rust → rust-analyzer
# Java → jdtls

# The LLM gets semantic understanding:
# - Type information
# - Import graph
# - Error diagnostics
# - Symbol definitions
```

### 🔄 Multi-Provider Support
```json
{
  "provider": "openrouter",
  "model": "minimax/minimax-m2.5",
  "apiKey": "your-openrouter-key"
}
// Switch to Claude in seconds:
{
  "provider": "anthropic",
  "model": "claude-sonnet-4-6"
}
```

### 💰 Free Tier Operation
```bash
# Option 1: Nvidia Build (recommended for quality)
# Models: Kimi K2.5, GLM-5, Minimax m2.5
# Cost: FREE (generous rate limits)
# Quality: Near-frontier performance

# Option 2: OpenRouter free models
# Models: Many free options
# Cost: FREE
# Tradeoff: Can be slow during peak times
```

### 🖥️ Cross-Platform
- macOS (Intel + Apple Silicon)
- Windows (x64 + ARM64)
- Linux (AppImage + .deb)
- Works in any terminal emulator

---

## How I Use It Personally

### The Hybrid Setup (Optimal Cost/Quality)
```bash
# Morning: Plan with Claude (expensive but worth it)
claude "analyze this feature, create implementation plan"
# → Get detailed plan with risks and steps

# Execution: Use Opencode + free models
opencode "implement step 1: create the User domain model"
opencode "implement step 2: add repository layer"
opencode "implement step 3: write unit tests"
# → ~$0 cost for mechanical implementation

# Review: Back to Claude for quality check
claude "review the changes, check for edge cases"
```

### When I Use What
| Task | Tool | Model | Cost |
|------|------|-------|------|
| Architecture planning | Claude | Opus 4.6 | $$ |
| Complex debugging | Claude | Sonnet 4.6 | $ |
| Mechanical diffs | Opencode | Minimax m2.5 | Free |
| Repetitive refactors | Opencode | Kimi K2.5 | Free |
| Simple CRUD | Opencode | OpenRouter free | Free |
| Code review | Copilot BugBot | GitHub | $20/mo |

---

## Free Tier Guide

### Option 1: Nvidia Build (Best Quality)
```bash
# Register at: build.nvidia.com
# Get API key

# Available free models (as of 2026):
# - Kimi K2.5 (Moonshot AI) — excellent coding
# - GLM-5 — good for Chinese + English
# - Minimax m2.5 — strong performance

# Configure Opencode:
cat > ~/.opencode/config.json << 'EOF'
{
  "provider": "nvidia",
  "apiKey": "your-nvidia-build-key",
  "model": "nv-us/kimi-k2.5"
}
EOF
```

### Option 2: OpenRouter
```bash
# Register at: openrouter.ai
# Many free models available

cat > ~/.opencode/config.json << 'EOF'
{
  "provider": "openrouter",
  "apiKey": "your-openrouter-key",
  "model": "minimax/minimax-m2.5:free"
}
EOF
```

### Option 3: AliCloud Coding
```bash
# Good aggregation of open-source models
# Best for: Asian language codebases
# Configure similarly to OpenRouter
```

---

## Provider Setup

### Anthropic (Claude)
```json
{
  "provider": "anthropic",
  "apiKey": "sk-ant-...",
  "model": "claude-sonnet-4-6"
}
```

### OpenAI
```json
{
  "provider": "openai",
  "apiKey": "sk-...",
  "model": "gpt-5"
}
```

### Nvidia Build (Free)
```json
{
  "provider": "nvidia",
  "baseUrl": "https://integrate.api.nvidia.com/v1",
  "apiKey": "nvapi-...",
  "model": "qwen/qwen-coder-2.5-instruct"
}
```

### OpenRouter
```json
{
  "provider": "openrouter",
  "baseUrl": "https://openrouter.ai/api/v1",
  "apiKey": "sk-or-...",
  "model": "minimax/minimax-m2.5:free"
}
```

See `examples/provider-config.json` for all configurations.

---

## Quick Start

```bash
# Installation
npm install -g opencode-ai
# or: pip install opencode
# or: Download binary from opencode.ai

# Initialize
opencode init

# Configure provider (interactive)
opencode config

# Start coding
opencode "add pagination to the users list endpoint"

# With specific provider
opencode --provider nvidia "refactor this function"
```

### Key Commands
```bash
opencode "task"              # Execute a coding task
opencode chat               # Interactive mode
opencode config             # Configure providers
opencode config --provider  # Switch provider
opencode --model "model"    # Use specific model
opencode context            # Show current context
```

---

## The PLAN → EXECUTE Pattern

The most cost-effective AI coding workflow in 2026:

```
┌─────────────────────────────────────────────────────┐
│                    THE WORKFLOW                      │
├─────────────────┬───────────────────────────────────┤
│   PLAN ($$$)    │  EXECUTE (free/cheap)              │
├─────────────────┼───────────────────────────────────┤
│ Claude Opus 4.6 │ Opencode + Nvidia Build            │
│ - Architecture  │ - Implement the plan               │
│ - Risk analysis │ - Mechanical diffs                 │
│ - Task breakdown│ - Repetitive edits                 │
│ - Sequencing    │ - Test generation                  │
└─────────────────┴───────────────────────────────────┘
```

**Why this works:**
- Planning requires deep reasoning → expensive model worth it
- Execution is mostly mechanical → free model is sufficient
- Senior engineer mentality: plan with the best, execute with efficiency

---

## Cost Optimization

### Monthly Cost Comparison

| Setup | Cost/Month | Quality | Best For |
|-------|-----------|---------|----------|
| Opencode + Nvidia Build | $0 | Good | Mechanical tasks |
| Opencode + OpenRouter | $0 | Varies | Experimental |
| Claude Code | $20-100+ | Excellent | Complex work |
| Cursor Pro | $20 | Excellent | IDE work |
| Hybrid (recommended) | $20-40 | Best | Everything |

### The Hacker Tier: $0/month
```bash
# Plan: Use free Claude.ai web (limited)
# Execute: Opencode + Nvidia Build (free)
# Review: GitHub Copilot free tier

# Realistic for: side projects, learning, OSS contributions
# Not ideal for: production systems, complex architectures
```

---

## Workflows

| Workflow | File | Description |
|----------|------|-------------|
| Hacker Tier | `workflows/hacker-tier.md` | 100% free AI development |
| Hybrid Approach | `workflows/hybrid-approach.md` | Expensive plan + free execute |
| Mechanical Tasks | `workflows/mechanical-tasks.md` | Repetitive automation |

---

## Project Structure

```
AI-ASSISTANT-OPENCODE/
├── README.md
├── index.html
├── docs/
│   ├── FEATURES.md
│   ├── GETTING_STARTED.md
│   ├── PROVIDERS.md
│   ├── WORKFLOWS.md
│   └── COST_GUIDE.md
├── scripts/
│   ├── setup-opencode.sh
│   ├── free-tier-setup.sh
│   └── provider-switch.sh
├── workflows/
│   ├── hacker-tier.md
│   ├── hybrid-approach.md
│   └── mechanical-tasks.md
├── examples/
│   ├── provider-config.json
│   └── effective-prompts.md
└── configs/
    └── .gitignore
```

---

## Resources

- [Official Website](https://opencode.ai)
- [GitHub Repository](https://github.com/sst/opencode)
- [OpenRouter](https://openrouter.ai)
- [Nvidia Build](https://build.nvidia.com)
- [Discord Community](https://opencode.ai/discord)

---

*Opencode — AI coding at zero cost. Showcase by mk-knight23, 2026.*
