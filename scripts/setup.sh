#!/bin/bash
# OpenCode Setup Script
# Run: chmod +x setup.sh && ./setup.sh

set -e
echo "🚀 Setting up OpenCode..."

# 1. Install OpenCode
echo "📦 Installing OpenCode..."
if command -v npm &> /dev/null; then
  npm install -g opencode-ai
  echo "✅ OpenCode installed via npm"
elif command -v brew &> /dev/null; then
  brew install opencode-ai/tap/opencode
  echo "✅ OpenCode installed via Homebrew"
else
  echo "📦 Manual install: https://github.com/sst/opencode"
  echo "   Or: curl -fsSL https://opencode.ai/install | bash"
fi

# 2. Set up free providers (no credit card!)
echo ""
echo "🆓 Setting up FREE providers..."
echo ""
echo "Option A: Nvidia Build (FREE — best free models)"
echo "  1. Sign up at: https://build.nvidia.com"
echo "  2. Get free API key"
echo "  3. Add to config: provider=nvidia-build"
echo "  Best models: Kimi K2.5, MiniMax M2.5"
echo ""
echo "Option B: OpenRouter (FREE models)"
echo "  1. Sign up at: https://openrouter.ai"
echo "  2. Get API key"
echo "  3. Filter ':free' models"
echo ""

# 3. Configure OpenCode
echo "⚙️  Setting up OpenCode config..."
mkdir -p ~/.config/opencode
cp configs/opencode.json ~/.config/opencode/config.json
echo "✅ Config copied to ~/.config/opencode/config.json"
echo "⚠️  Edit it and add your API keys"

# 4. Install skills
echo "🎯 Installing Antigravity Awesome Skills for OpenCode..."
npx antigravity-awesome-skills

echo ""
echo "✨ OpenCode is ready!"
echo ""
echo "Key Commands:"
echo "  opencode             # Start interactive session"
echo "  opencode -m <model>  # Use specific model"
echo "  opencode --list      # List available models"
echo ""
echo "PLAN→EXECUTE Pattern (costs almost zero):"
echo "  1. Plan with Claude Opus: opencode -m claude-opus-4-6"
echo "     'Create a plan for building a REST API with auth'"
echo "  2. Execute with Kimi K2 (FREE): opencode -m moonshotai/kimi-k2"
echo "     'Now implement the plan'"
echo ""
echo "Providers in config:"
echo "  anthropic  — Claude models (paid)"
echo "  openai     — GPT models (paid)"
echo "  nvidia     — Kimi K2, MiniMax (FREE)"
echo "  openrouter — Mixed :free models (FREE)"
echo "  google     — Gemini models (free tier)"
