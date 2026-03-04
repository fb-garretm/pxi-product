#!/usr/bin/env bash
# Export a Markdown file to DOCX using pandoc.
# Requires: brew install pandoc (one-time)
# Usage: ./scripts/export-docx.sh path/to/file.md
# Output: path/to/file.docx (same path, .docx extension)

set -e
if ! command -v pandoc &>/dev/null; then
  echo "Pandoc is not installed. Install with: brew install pandoc"
  exit 1
fi
if [[ -z "$1" ]]; then
  echo "Usage: $0 <file.md>"
  exit 1
fi
INPUT="$1"
OUTPUT="${INPUT%.md}.docx"
pandoc -s "$INPUT" -o "$OUTPUT"
echo "Created: $OUTPUT"
