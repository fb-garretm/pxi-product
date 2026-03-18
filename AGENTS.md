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
| `prototypes/` | Interactive HTML wireframes generated from PRDs |
| `strategy/` | Roadmap, vision, strategic planning |
| `templates/` | Reusable document templates |
| `.cursor/skills/` | Cursor Agent Skills — auto-applied when writing PRDs, discovery docs, or importing documents |
| `memory/` | Persistent agent memory — recent context, long-term knowledge, and active project state |

## Persistent memory

### Session startup (do this every time)

1. **Read `memory/recent-memory.md` in full.** Treat its contents as inline context for the current conversation. This is the rolling 48-hour window of decisions, actions, and context from prior sessions.
2. **Read `memory/long-term-memory.md` in full.** This contains stable facts, preferences, patterns, and past decisions that persist across sessions.
3. **Check `memory/project-memory.md`** when the conversation involves active work, blockers, or project status.
4. **Auto-consolidate if stale.** Look at the most recent `### YYYY-MM-DD HH:MM` timestamp in `recent-memory.md`. If it is **older than 24 hours** (or the file has no entries yet), immediately run the `consolidate-memory` skill before doing anything else. This is the scheduled job — every session start is the trigger.

### Session end

At the **end of a significant session** (substantial decisions made, new preferences expressed, or project state changed), run the `consolidate-memory` skill to capture what happened before closing out.

### Memory rules

- **Never fabricate memory entries.** Every entry must trace to a real source (commit, file change, conversation).
- The helper script `scripts/consolidate-memory.sh` can be invoked by the agent for the mechanical parts (git-log extraction, entry creation, 48-hour pruning). The `consolidate-memory` skill handles the full semantic flow including promotion and project-state updates.

## Agent guidelines

### Creating documents
- Always start from the appropriate template in `templates/` when creating a new PRD, discovery doc, or importing a document.
- Name files with lowercase kebab-case: `feature-name.md`, `topic-research.md`.
- Place documents in the correct top-level folder based on their type.
- Prototypes belong in `prototypes/` as self-contained HTML artifacts that open directly in a browser. Prefer single-file `index.html` prototypes with inline CSS/JS over app-style build systems.

### No unverified facts

Never reference data points, APIs, database tables, schema fields, organization types, repositories, services, or other system artifacts as existing or established unless:

1. **Another document in this repo explicitly describes them as existing, shipped, or built** — not just proposed or planned in a PRD.
2. **The user confirms they exist.**

When uncertain whether something exists, **ask the user** before writing it as fact. When proposing something new (a new API, a new table, a new org type), clearly label it as **new** or **proposed** — never state it as if the system already has it.

This applies to all document types: PRDs, discovery docs, context briefs, insights, ticket breakdowns, and review feedback.

### Editing documents
- When asked to iterate on a document, preserve existing content unless explicitly told to remove it. Add, refine, or restructure — don't delete without being asked.
- Use clear Markdown formatting: headings, tables, checklists, and bullet points.
- Keep language concise and direct. Avoid filler.

### What this repo is NOT
- No application source code, build systems, or dependencies.
- No CI/CD, Docker, or infrastructure configuration.
- Do not create `package.json`, `requirements.txt`, or similar files.

### Exception for prototypes
- `prototypes/` is the exception to the "no application code" rule. These files are product artifacts, not production apps.
- Keep prototypes lightweight and portable: no build step, no package manager, no framework setup required to view them.
