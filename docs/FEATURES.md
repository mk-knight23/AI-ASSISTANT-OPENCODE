# Opencode — Features Deep Dive

> Opencode — Open source terminal AI coding agent. Run on any provider. Zero lock-in.

## Philosophy

Opencode is built for developers who want:
- **No vendor lock-in** — switch providers any time
- **Zero cost option** — use free Nvidia Build tier
- **Terminal native** — no GUI, pure keyboard workflow
- **Hackable** — open source, extend it yourself
- **LSP integration** — understands your code like an IDE

---

## Feature 1: LSP Auto-Loading

Opencode automatically detects and loads Language Server Protocol servers:

```
Project detected: Node.js/TypeScript
Auto-loaded:
├── typescript-language-server  → type checking, completions
├── eslint-lsp                  → linting
└── prettier-lsp                → formatting

Project detected: Python
Auto-loaded:
├── pylsp                       → Python analysis
├── ruff-lsp                    → fast linting
└── pyright                     → type checking
```

**Benefit:** Opencode understands your code's types, errors, and structure without you configuring anything.

---

## Feature 2: Multi-Provider Support

Switch between providers without changing your workflow:

| Provider | Models | Cost | Best For |
|----------|--------|------|----------|
| Anthropic | claude-opus-4-6, claude-sonnet-4-6, claude-haiku-4-5 | Paid | Quality coding |
| OpenAI | gpt-4o, o3-mini | Paid | Broad tasks |
| **Nvidia Build** | Kimi K2.5, Minimax m2.5 | **FREE** | Most tasks |
| **OpenRouter** | 100+ models | Some free | Model variety |
| Ollama | llama3, mistral, codellama | Free (local) | Privacy |

**Switch provider:**
```bash
# Edit config
opencode config set provider nvidia

# Or per-session
opencode --provider anthropic "Refactor this module"
```

---

## Feature 3: Zero-Cost Tier (Nvidia Build)

The best free AI coding setup:

```bash
# 1. Get free API key
# Visit: build.nvidia.com → Create account → Get API key

# 2. Configure opencode
opencode config set provider nvidia
opencode config set api_key $NVIDIA_API_KEY

# Available free models:
# - Kimi K2.5 (1M context) — excellent for large codebases
# - Minimax m2.5 — fast, great for quick edits
# - Many more via OpenRouter free tier
```

**Real cost:** $0/month for most development work.

---

## Feature 4: PLAN → EXECUTE Pattern

The optimal cost/quality workflow:

```
Step 1: PLAN (use Opus — expensive but worth it once)
opencode --provider anthropic --model claude-opus-4-6 \
  "Plan the implementation of a caching layer for our API.
   Output a detailed step-by-step plan."

Step 2: EXECUTE (use free tier — same result, $0)
opencode --provider nvidia --model kimi-k2-5 \
  "Follow this plan exactly: [paste plan]
   Implement each step."
```

**Result:** Expert-quality implementation at near-zero cost.

---

## Feature 5: Terminal-Native UI

Opencode is built for terminal power users:

```bash
# Interactive TUI mode
opencode

# Direct task execution
opencode "Fix the failing tests in src/auth/"

# Pipe-friendly
cat error.log | opencode "Diagnose this error"
git diff | opencode "Write a commit message for these changes"
cat schema.sql | opencode "Generate TypeScript types for this schema"
```

**Keyboard shortcuts in TUI:**
- `Ctrl+C` — Cancel current task
- `Ctrl+D` — Exit
- `Tab` — Accept suggestion
- `↑/↓` — History navigation

---

## Feature 6: Configuration

```toml
# ~/.config/opencode/config.toml

[default]
provider = "nvidia"
model = "kimi-k2-5"
max_tokens = 128000

[providers.anthropic]
api_key = "sk-ant-..."
model = "claude-sonnet-4-6"

[providers.nvidia]
api_key = "nvapi-..."
model = "kimi-k2-5"

[providers.openrouter]
api_key = "sk-or-..."
model = "google/gemini-pro"

[behavior]
auto_accept_tools = false
show_tool_calls = true
verbose = false
```

---

## Feature 7: Open Source & Extensible

Opencode is fully open source (GitHub: opencode-ai/opencode):

- Write custom tools in TypeScript/Python
- Add new provider adapters
- Custom prompt templates
- Shell integration hooks
- Contribute back to the community

---

## Feature 8: Large Context Handling

Kimi K2.5 (via Nvidia Build, free) has **1M token context window**:

```bash
# Feed your entire codebase
find . -name "*.ts" | xargs cat | opencode \
  "Analyze this entire TypeScript codebase and find:
   1. Security vulnerabilities
   2. Performance bottlenecks
   3. Dead code
   4. Missing error handling"
```

1M tokens ≈ 750,000 words ≈ most medium-sized codebases.

---

## Feature 9: Composability

Opencode composes with Unix tools:

```bash
# Research → Implement pipeline
opencode "What's the best way to implement rate limiting in Express?" \
  > research.md && \
  opencode "Based on $(cat research.md), implement rate limiting in src/middleware/"

# Parallel execution with &
opencode "Write unit tests for src/auth/" &
opencode "Write unit tests for src/payments/" &
wait
echo "Both test suites complete"

# Watch mode
ls -la src/ | entr opencode "A file changed. Update the index file if needed."
```

---

## Why Opencode Over Commercial Tools?

| | Opencode | Cursor | Copilot | Claude Code |
|--|---------|--------|---------|-------------|
| Cost | Free tier | $20/mo | $10-19/mo | API cost |
| Open Source | ✓ | ✗ | ✗ | ✗ |
| Provider choice | ✓ | Partial | ✗ | Anthropic only |
| Terminal native | ✓ | ✗ | ✗ | ✓ |
| LSP integration | ✓ | ✓ | ✓ | ✗ |
| Self-host | ✓ | ✗ | ✗ | ✗ |
