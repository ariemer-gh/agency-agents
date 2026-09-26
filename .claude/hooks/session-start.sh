#!/bin/bash
# Installs all Agency agents into ~/.claude/agents for Claude Code on the web.
set -euo pipefail

# Only run in remote (Claude Code on the web) sessions
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

cd "${CLAUDE_PROJECT_DIR:-$(dirname "$0")/../..}"

# Idempotent: install.sh overwrites existing agent files
./scripts/install.sh --tool claude-code >&2
