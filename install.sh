#!/usr/bin/env bash
# =============================================================================
# FinOps Token Optimization — install.sh
# Installs the Zone-Based Execution Model for macOS, Linux, and WSL
# Usage: curl -fsSL https://raw.githubusercontent.com/Rezhnn/Token-Optimization/main/install.sh | bash
# =============================================================================

set -euo pipefail

REPO_RAW="https://raw.githubusercontent.com/Rezhnn/Token-Optimization/main"
TARGET_DIR="${1:-.}"
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

log_info()    { echo -e "${BLUE}[finops]${NC} $1"; }
log_success() { echo -e "${GREEN}[finops] ✓${NC} $1"; }
log_warn()    { echo -e "${YELLOW}[finops] ⚠${NC} $1"; }

echo ""
echo "  ⚡ FinOps Token Optimization — Zone-Based Execution Model"
echo "  https://github.com/Rezhnn/Token-Optimization"
echo ""

# --- Download ignore template ---
log_info "Downloading ignore boundary template..."
IGNORE_TEMPLATE=$(curl -fsSL "${REPO_RAW}/skills/finops-zones/templates/ignore.template")

# --- Write all AI ignore files (aligned) ---
IGNORE_FILES=(".geminiignore" ".cursorignore" ".claudeignore" ".codexignore" ".openaiignore")
for f in "${IGNORE_FILES[@]}"; do
  if [ -f "${TARGET_DIR}/${f}" ]; then
    log_warn "${f} already exists — overwriting..."
  fi
  echo "$IGNORE_TEMPLATE" > "${TARGET_DIR}/${f}"
  log_success "Wrote ${f}"
done

# --- Download protocol files ---
PROTOCOL_FILES=(
  "HYBRID_RUNTIME_SPEC.md"
  "AGENTS.md"
  "CLAUDE.md"
  "GEMINI.md"
  ".cursorrules"
)
for file in "${PROTOCOL_FILES[@]}"; do
  log_info "Downloading ${file}..."
  curl -fsSL "${REPO_RAW}/${file}" -o "${TARGET_DIR}/${file}"
  log_success "Wrote ${file}"
done

echo ""
echo -e "${GREEN}  ✓ Installation complete!${NC}"
echo ""
echo "  Zone-Based Execution is now active in this workspace."
echo "  Use [PLAN], [ARCH], [CMD], [GIT], \$ prefixes to control zones."
echo "  Run '!verbose', '!fast', '!code' mid-session for overrides."
echo ""
echo "  Read the docs: ${TARGET_DIR}/HYBRID_RUNTIME_SPEC.md"
echo ""
