---
name: running-discovery
description: Creates and edits discovery documents for research and exploration. Use when creating a discovery doc, editing files in discovery/, or when the user says "research," "discovery," "explore," or "investigate."
---

# Running Discovery

## Before writing

1. Read `templates/discovery.md` — use it as the starting structure for every new discovery doc.
2. Check `prds/` for any related PRDs that provide context on what we're building or considering.

## Conventions

- **Lead with hypothesis.** What do we believe? What assumption are we testing? This frames everything that follows.
- **Lightweight methods only.** User conversations, competitive looks, internal team feedback, support ticket review. No heavy data analysis or product analytics — we don't have them.
- **Findings are structured.** Key insights first, then supporting evidence. Not a wall of text.
- **Always end with actionable output.** Concrete recommendations and clear next steps.
- **Language** is concise and direct. Match the PRD template's tone.

## File placement

- Save discovery docs in `discovery/` with kebab-case names: `topic-name.md`.
- If a related PRD exists, link to it: `[Related PRD](../prds/feature-name.md)`.

## When editing an existing discovery doc

Preserve existing content unless explicitly told to remove it. Add findings, refine recommendations, or restructure — don't delete without being asked.
