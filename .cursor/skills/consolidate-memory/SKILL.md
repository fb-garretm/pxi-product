---
name: consolidate-memory
description: Reads recent activity, extracts key decisions, preferences, and facts, updates the memory files, and promotes important items from recent → long-term. Use when the user says "consolidate memory," "update memory," "sync memory," "nightly memory," or at the start/end of a working session.
---

# Consolidate Memory

## Purpose

Maintain the persistent memory layer in `memory/`. This skill gathers context from the last 24 hours of activity, distills it into the three memory files, and promotes durable facts from recent memory to long-term memory.

## Sources of truth

Cursor does not expose raw conversation logs as files. Instead, gather recent context from these sources — check **all** of them:

1. **Git log (last 24 h)**
   ```bash
   git log --since="24 hours ago" --pretty=format:"%h %ad %s" --date=short
   ```
   Commit messages reveal what was worked on, decisions made, and features touched.

2. **Git diff summary (last 24 h)**
   ```bash
   git diff $(git log --since="24 hours ago" --format="%H" | tail -1)..HEAD --stat
   ```
   Shows which files changed and scope of work.

3. **Recently modified files**
   ```bash
   find . -name '*.md' -newer memory/recent-memory.md -not -path './.git/*' | head -30
   ```
   Any doc newer than the last consolidation is a candidate for review.

4. **The memory files themselves** — read all three before making changes:
   - `memory/recent-memory.md`
   - `memory/long-term-memory.md`
   - `memory/project-memory.md`

5. **Current session context** — if the user triggers this mid-session, also consider what was discussed or decided in the current conversation.

## Consolidation procedure

### Step 1 — Gather

Read all five sources above. Build a mental list of:
- **Decisions** — choices that were made and why
- **Preferences** — how the user wants things done (tone, format, workflow)
- **Facts** — stable truths about the product, team, stack, or domain
- **Actions** — what was done, shipped, or changed
- **Open questions** — unresolved items that need follow-up

### Step 2 — Update recent-memory.md

Add new entries at the top (newest first) using this format:

```markdown
### YYYY-MM-DD HH:MM — [decision | preference | context | action]
Brief description.
- Supporting detail
- Supporting detail
```

**Prune** entries older than 48 hours. Before deleting a stale entry, check whether it should be promoted (Step 3).

### Step 3 — Promote to long-term-memory.md

Review entries being pruned from recent memory. Promote an entry if it meets **any** of these criteria:

| Promote when… | Target section |
|---|---|
| A decision was made with stated rationale | Decisions & Rationale |
| The user expressed a reusable preference | User Preferences |
| A pattern appeared across ≥ 2 sessions | Patterns & Conventions |
| A stable fact was established (confirmed, not just proposed) | Facts & Context |
| An approach was explicitly rejected | Anti-Patterns |

When promoting, **distill** — don't copy verbatim. Collapse detail into one or two lines with enough context to be useful months later.

**Do not duplicate.** Before adding to long-term memory, check whether the item (or a close variant) already exists. If it does, update the existing entry rather than creating a new one.

### Step 4 — Update project-memory.md

Refresh the active-state tables:

- Move newly started work into **Active Work**.
- Move completed items to **Recently Completed** (archive items older than ~2 weeks).
- Update or add **Blocked / Waiting** items.
- Add or resolve **Open Questions**.
- Update **Key Contacts & Ownership** if new ownership info surfaced.

### Step 5 — Commit

Stage and commit the memory updates:

```bash
git add memory/
git commit -m "chore: nightly memory consolidation"
```

## Output

After consolidation, reply with a short summary:

```
### Memory consolidation complete

**Added to recent:** N entries
**Promoted to long-term:** N entries
**Pruned from recent:** N entries
**Project state updated:** yes/no
```

If nothing meaningful happened in the last 24 hours, say so:

```
### Memory consolidation — no new activity
No significant changes found since last consolidation.
```

## Automation

The mechanical portion of this skill (git-log extraction, entry creation, 48-hour pruning) runs automatically:

- **GitHub Actions:** `.github/workflows/nightly-memory-consolidation.yml` — runs every night at 2:00 AM UTC and can be triggered manually from the Actions tab.
- **Local cron (optional):** `bash scripts/setup-memory-cron.sh` installs a local 2:00 AM cron job.

The automated script handles Steps 1–2 and the pruning half of Step 2. **Steps 3–4 (promotion to long-term, project-state updates) require this agent skill** because they need semantic understanding.

## Rules

- Never fabricate entries. Every memory item must trace to a real source (commit, file change, conversation).
- Never remove long-term memory entries unless the user explicitly says to.
- Preserve the structure and section headings of all three memory files.
- Use ISO timestamps (YYYY-MM-DD HH:MM) in UTC or the user's local timezone, whichever is established.
- Keep entries concise — one to three lines max.
