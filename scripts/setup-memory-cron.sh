#!/usr/bin/env bash
# setup-memory-cron.sh
#
# Installs a nightly cron job that runs memory consolidation at 2:00 AM local time.
# Run once to set up; re-running is safe (idempotent).
#
# Usage:
#   bash scripts/setup-memory-cron.sh          # install cron
#   bash scripts/setup-memory-cron.sh --remove  # remove cron

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
CRON_CMD="cd $REPO_ROOT && bash scripts/consolidate-memory.sh >> /tmp/consolidate-memory.log 2>&1"
CRON_LINE="0 2 * * * $CRON_CMD"
CRON_TAG="# pxi-product memory consolidation"

if [ "${1:-}" = "--remove" ]; then
  crontab -l 2>/dev/null | grep -v "$CRON_TAG" | crontab -
  echo "Removed memory consolidation cron job."
  exit 0
fi

# Add the cron job if it doesn't already exist
(crontab -l 2>/dev/null | grep -v "$CRON_TAG"; echo "$CRON_LINE $CRON_TAG") | crontab -

echo "Installed nightly memory consolidation cron job (2:00 AM daily)."
echo "Logs: /tmp/consolidate-memory.log"
echo ""
echo "To remove:  bash scripts/setup-memory-cron.sh --remove"
echo "To verify:  crontab -l"
