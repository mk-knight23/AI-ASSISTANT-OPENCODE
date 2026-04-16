#!/usr/bin/env bash
# =============================================================================
# 🔓 Opencode Provider Switcher
# Instantly rotate between Nvidia, OpenRouter, and Local providers.
# Usage: ./switch.sh <provider_name> [model_name]
# =============================================================================

set -euo pipefail

BLUE='\033[0;34m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; RED='\033[0;31m'; NC='\033[0m'
log()  { echo -e "${BLUE}[opencode-switch]${NC} $*"; }
ok()   { echo -e "${GREEN}[✓]${NC} $*"; }
warn() { echo -e "${YELLOW}[!]${NC} $*"; }

CONFIG_FILE="$HOME/.opencode/config.json"
mkdir -p "$(dirname "$CONFIG_FILE")"

PROVIDER="${1:-}"
MODEL="${2:-}"

show_usage() {
  echo "Usage: ./switch.sh <provider> [model]"
  echo ""
  echo "Available Providers:"
  echo "  nvidia       - Nvidia Build (Free level, High quality)"
  echo "  openrouter   - OpenRouter (Aggregator, many free models)"
  echo "  ollama       - Local hosting (Air-gapped, zero cost)"
  echo "  anthropic    - Claude (Premium, for planning)"
  exit 1
}

if [[ -z "$PROVIDER" ]]; then show_usage; fi

case "$PROVIDER" in
  nvidia)
    MODEL_NAME="${MODEL:-deepseek-ai/deepseek-v3}"
    cat > "$CONFIG_FILE" << EOF
{
  "provider": "nvidia",
  "baseUrl": "https://integrate.api.nvidia.com/v1",
  "model": "$MODEL_NAME"
}
EOF
    ;;
  openrouter)
    MODEL_NAME="${MODEL:-google/gemini-2.0-flash-exp:free}"
    cat > "$CONFIG_FILE" << EOF
{
  "provider": "openrouter",
  "baseUrl": "https://openrouter.ai/api/v1",
  "model": "$MODEL_NAME"
}
EOF
    ;;
  ollama)
    MODEL_NAME="${MODEL:-llama3}"
    cat > "$CONFIG_FILE" << EOF
{
  "provider": "openai",
  "baseUrl": "http://localhost:11434/v1",
  "model": "$MODEL_NAME"
}
EOF
    ;;
  *)
    warn "Unknown provider: $PROVIDER"
    show_usage
    ;;
esac

ok "Switched Opencode to $PROVIDER ($MODEL_NAME)"
log "Ensure your API keys are set in your environment variables."
