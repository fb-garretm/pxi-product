# pxi-product

Product artifact and document repository for PXI. This repo is the single source of truth for PRDs, discovery materials, and other product documents.

## Structure

```
prds/              — Product Requirements Documents
discovery/         — Research, user interviews, competitive analysis, exploration
templates/         — Reusable templates for creating new documents
.cursor/skills/    — Cursor Agent Skills (writing-prds, running-discovery)
```

## Usage

Use the templates in `templates/` as starting points when creating new documents:

- **PRD** — `templates/prd.md`
- **Discovery** — `templates/discovery.md`

Place finished (or in-progress) documents in the appropriate top-level folder.

## Working with AI agents

This repo is designed to be used with Cursor agents. Agent skills in `.cursor/skills/` auto-apply conventions when writing PRDs or discovery docs. Agents can:

- Draft new PRDs or discovery docs from a brief description
- Iterate on existing documents based on feedback
- Cross-reference discovery findings when writing requirements
- Maintain consistency across documents

See `AGENTS.md` for agent-specific instructions.
