#!/usr/bin/env bash
# =============================================================================
# 🔓 Opencode Setup Script (Premium Edition)
# Sets up Opencode with 2026 Free Tier models (DeepSeek-V3, Gemini 2.0).
# Run: chmod +x setup.sh && ./setup.sh
# =============================================================================

set -euo pipefail

BLUE='\033[0;34m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; CYAN='\033[0;36m'; NC='\033[0m'
log()  { echo -e "${BLUE}[opencode-setup]${NC} $*"; }
ok()   { echo -e "${GREEN}[✓]${NC} $*"; }
warn() { echo -e "${YELLOW}[!]${NC} $*"; }
tip()  { echo -e "${CYAN}[tip]${NC} $*"; }

log "Opencode Mechanical Execution Init..."

# 1. Install CLI
if command -v opencode >/dev/null 2>&1; then
  ok "Opencode CLI is ready."
else
  log "Installing Opencode CLI..."
  npm install -g @opencode-ai/cli >/dev/null 2>&1 || warn "NPM install failed - ensure Node.js is installed."
fi

# 2. Key Collection (2026 Meta)
echo ""
tip "Recommended: Get a free key at https://openrouter.ai (Gemini 2.0 Flash is free)."
tip "Recommended: Get a free key at https://build.nvidia.com (DeepSeek-V3 is free)."
echo ""

read -p "Nvidia Build API Key (DeepSeek/Llama): " NVIDIA_KEY
read -p "OpenRouter API Key (Gemini/Mistral): " OR_KEY

# 3. Secure Config Storage
CONFIG_DIR="$HOME/.config/opencode"
mkdir -p "$CONFIG_DIR"

cat > "$CONFIG_DIR/config.toml" << TOML_EOF
[default]
provider = "nvidia"
model = "deepseek-ai/deepseek-v3"
max_tokens = 163840
stream = true

[providers.nvidia]
api_key = "${NVIDIA_KEY}"
base_url = "https://integrate.api.nvidia.com/v1"
model = "deepseek-ai/deepseek-v3"

[providers.openrouter]
api_key = "${OR_KEY}"
base_url = "https://openrouter.ai/api/v1"
model = "google/gemini-2.0-flash-exp:free"
TOML_EOF

ok "Config initialized at $CONFIG_DIR/config.toml"

# 4. Mechanical Agent Injection
log "Injecting Mechanical Grunt agent..."
mkdir -p .opencode/agents
cat > .opencode/agents/grunt.md << 'EOF'
# Mechanical Execution Agent
You are a "Grunt" - a high-speed, zero-cost execution engine.
Your goal is to perform mechanical code transformations with 100% precision.

## Workflow
1. Read the provided diff or task.
2. Execute the change exactly as requested.
3. If uncertainty > 10%, STOP and request a 'Plan' from the Claude assistant.
4. NEVER invent new logic; only refactor or implement predefined patterns.
EOF
ok "Mechanical agent injected."

# 5. Switcher Shortcut
chmod +x ./switch.sh 2>/dev/null || true
ok "Switcher script enabled (./switch.sh)"

echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}  Opencode Ecosystem Setup Complete!           ${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo "Mechanical Workflow:"
echo "  1. PLAN    (Claude):  Write the implementation plan."
echo "  2. EXECUTE (Opencode): Run './switch.sh nvidia' then 'opencode apply plan'."
echo "  3. VERIFY  (Cursor):   Visual check and testing."
echo ""
log "Run 'opencode' to start the mechanical loop."
