# AGENTS.md

## Repository purpose

`pxi-product` is a **product document repository** — not a code project. It contains PRDs, discovery materials, and other product artifacts in Markdown.

## Directory structure

| Folder | Contents |
|--------|----------|
| `prds/` | Product Requirements Documents |
| `discovery/` | Research, interviews, competitive analysis |
| `notes/` | Meeting notes, general notes, action items |
| `products/` | Product overviews, feature descriptions, specs |
| `strategy/` | Roadmap, vision, strategic planning |
| `templates/` | Reusable document templates |
| `.cursor/skills/` | Cursor Agent Skills — auto-applied when writing PRDs, discovery docs, or importing documents |

## Agent guidelines

### Creating documents
- Always start from the appropriate template in `templates/` when creating a new PRD, discovery doc, or importing a document.
- Name files with lowercase kebab-case: `feature-name.md`, `topic-research.md`.
- Place documents in the correct top-level folder based on their type.

### Editing documents
- When asked to iterate on a document, preserve existing content unless explicitly told to remove it. Add, refine, or restructure — don't delete without being asked.
- Use clear Markdown formatting: headings, tables, checklists, and bullet points.
- Keep language concise and direct. Avoid filler.

### What this repo is NOT
- No application source code, build systems, or dependencies.
- No CI/CD, Docker, or infrastructure configuration.
- Do not create `package.json`, `requirements.txt`, or similar files.
