#!/usr/bin/env bash
# =============================================================================
# Opencode Setup Script
# Sets up Opencode with free Nvidia Build tier + optional paid providers
# Run: chmod +x setup.sh && ./setup.sh
# =============================================================================

set -euo pipefail

BLUE='\033[0;34m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; CYAN='\033[0;36m'; NC='\033[0m'
log()  { echo -e "${BLUE}[opencode-setup]${NC} $*"; }
ok()   { echo -e "${GREEN}[✓]${NC} $*"; }
warn() { echo -e "${YELLOW}[!]${NC} $*"; }
tip()  { echo -e "${CYAN}[tip]${NC} $*"; }

log "Opencode Setup (with FREE tier)"

# Install
if command -v opencode >/dev/null 2>&1; then
  ok "Opencode already installed"
else
  log "Installing Opencode..."
  npm install -g opencode-ai && ok "Opencode installed" || \
  { warn "npm install failed. Try: cargo install opencode"; }
fi

# Config directory
CONFIG_DIR="$HOME/.config/opencode"
mkdir -p "$CONFIG_DIR"

echo ""
tip "Nvidia Build is FREE. Get your key at: https://build.nvidia.com"
echo ""

# Collect API keys
read -p "Nvidia Build API key (free at build.nvidia.com): " NVIDIA_KEY
read -p "Anthropic API key (optional - for best quality): " ANTHROPIC_KEY
read -p "OpenRouter API key (optional - many free models): " OR_KEY

# Write config
DEFAULT_PROVIDER="nvidia"
[[ -z "$NVIDIA_KEY" ]] && DEFAULT_PROVIDER="anthropic"
[[ -z "$NVIDIA_KEY" && -z "$ANTHROPIC_KEY" ]] && DEFAULT_PROVIDER="ollama"

cat > "$CONFIG_DIR/config.toml" << TOML_EOF
[default]
provider = "${DEFAULT_PROVIDER}"
model = "kimi-k2-5"
max_tokens = 128000
show_tool_calls = true
TOML_EOF

[[ -n "$ANTHROPIC_KEY" ]] && cat >> "$CONFIG_DIR/config.toml" << TOML_EOF

[providers.anthropic]
api_key = "${ANTHROPIC_KEY}"
model = "claude-sonnet-4-6"
TOML_EOF

[[ -n "$NVIDIA_KEY" ]] && cat >> "$CONFIG_DIR/config.toml" << TOML_EOF

[providers.nvidia]
api_key = "${NVIDIA_KEY}"
model = "kimi-k2-5"
TOML_EOF

[[ -n "$OR_KEY" ]] && cat >> "$CONFIG_DIR/config.toml" << TOML_EOF

[providers.openrouter]
api_key = "${OR_KEY}"
model = "google/gemini-flash-1.5"
TOML_EOF

ok "Config saved to $CONFIG_DIR/config.toml"

# Project instructions
mkdir -p .opencode
if [[ ! -f .opencode/instructions.md ]]; then
  cat > .opencode/instructions.md << 'EOF'
# Project Instructions

## Stack
<!-- Fill in your technology stack -->

## Standards
- Follow existing patterns
- Handle all errors explicitly
- Tests must pass before done

## Commands
<!-- Fill in project commands -->
EOF
  ok "Created .opencode/instructions.md"
fi

echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}  Opencode Setup Complete!${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo "Usage:"
echo "  opencode                           Interactive TUI"
echo "  opencode 'Fix the failing tests'   Direct task"
echo "  git diff | opencode 'Review this'  Pipe input"
echo ""
tip "PLAN→EXECUTE: Plan with claude-opus-4-6, execute with nvidia/kimi-k2-5"
