#!/usr/bin/env bash
# consolidate-memory.sh
#
# Automated nightly memory consolidation for the pxi-product repo.
# Gathers git activity from the last 24 hours, appends it to
# memory/recent-memory.md, prunes entries older than 48 hours,
# and commits the result.
#
# Designed to run via cron or manually:
#   bash scripts/consolidate-memory.sh
#
# For full semantic consolidation (promotion to long-term, project-state
# updates), trigger the Cursor agent skill "consolidate memory" instead.
# This script handles the mechanical parts that don't require an LLM.

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
RECENT="$REPO_ROOT/memory/recent-memory.md"
LONG_TERM="$REPO_ROOT/memory/long-term-memory.md"
PROJECT="$REPO_ROOT/memory/project-memory.md"
NOW_ISO="$(date -u +"%Y-%m-%d %H:%M")"
CUTOFF_48H="$(date -u -d '48 hours ago' +"%Y-%m-%d %H:%M" 2>/dev/null || date -u -v-48H +"%Y-%m-%d %H:%M" 2>/dev/null || echo "")"

cd "$REPO_ROOT"

# --- Gather git activity from the last 24 hours ---

COMMITS="$(git log --since="24 hours ago" --pretty=format:"- %h %s (%ad)" --date=short 2>/dev/null || true)"
CHANGED_FILES="$(git log --since="24 hours ago" --pretty=format: --name-only 2>/dev/null | sort -u | grep -v '^$' || true)"
CHANGED_MD="$(echo "$CHANGED_FILES" | grep '\.md$' || true)"

if [ -z "$COMMITS" ]; then
  echo "[consolidate-memory] No commits in the last 24 hours. Nothing to do."
  exit 0
fi

# --- Build the new recent-memory entry ---

ENTRY="### $NOW_ISO — action
Automated consolidation of git activity (last 24 h).
"

if [ -n "$COMMITS" ]; then
  ENTRY="$ENTRY
**Commits:**
$COMMITS
"
fi

if [ -n "$CHANGED_MD" ]; then
  ENTRY="$ENTRY
**Docs touched:**
$(echo "$CHANGED_MD" | sed 's/^/- /')
"
fi

# --- Prepend new entry to recent-memory.md ---

MARKER="<!-- Entries below this line — newest first -->"

if grep -qF "$MARKER" "$RECENT"; then
  # Insert new entry right after the marker line
  TEMP="$(mktemp)"
  awk -v marker="$MARKER" -v entry="$ENTRY" '
    { print }
    index($0, marker) { printf "\n%s\n", entry }
  ' "$RECENT" > "$TEMP"
  mv "$TEMP" "$RECENT"
else
  # Marker missing — append to end
  printf "\n%s\n" "$ENTRY" >> "$RECENT"
fi

# --- Prune entries older than 48 hours ---
# Heuristic: remove ### blocks whose timestamp is older than 48 h.
# Full semantic pruning (with promotion) is handled by the agent skill.

if [ -n "$CUTOFF_48H" ]; then
  TEMP="$(mktemp)"
  awk -v cutoff="$CUTOFF_48H" '
    /^### [0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}/ {
      ts = substr($0, 5, 16)
      if (ts < cutoff) { skip = 1; next }
      else { skip = 0 }
    }
    /^### / && skip { skip = 0 }
    !skip { print }
  ' "$RECENT" > "$TEMP"
  mv "$TEMP" "$RECENT"
fi

# --- Commit ---

cd "$REPO_ROOT"
git add memory/
if git diff --cached --quiet; then
  echo "[consolidate-memory] Memory files unchanged. No commit needed."
else
  git commit -m "chore: nightly memory consolidation — $NOW_ISO"
  echo "[consolidate-memory] Committed memory update."
fi
