---
name: writing-prds
description: Drafts and edits Product Requirements Documents following team conventions. Use when creating a PRD, editing files in prds/, or when the user says "write a PRD," "draft requirements," or "new feature doc."
---

# Writing PRDs

## Before writing

1. Read `templates/prd.md` — use it as the starting structure for every new PRD.
2. Check `discovery/` for any related research. If a discovery doc exists for this topic, read it and use its insights to inform the Problem, requirements, and success signals.

## Conventions

- **Section order matters.** Ship by and Design/UX come first, right after the title.
- **"What & why"** is one sentence. Not a paragraph.
- **Requirements** are grouped by theme or area of the feature or product. Each theme has P0 (must ship) and P1 (in scope if we have time) if applicable. No P2.
- **"How we'll know it worked"** must be qualitative — observable signals like "users stop asking for X" or "we can do Y without the workaround." No analytics, no dashboards, no metrics tables.
- **"Out of scope"** is required, not optional. Every PRD needs it.
- **Language** is concise and direct. No filler, no corporate speak.

## File placement

- Save PRDs in `prds/` with kebab-case names: `feature-name.md`.
- If a related discovery doc exists, link to it: `[Discovery](../discovery/topic-name.md)`.

## When editing an existing PRD

Preserve existing content unless explicitly told to remove it. Refine, restructure, or add — don't delete without being asked.
