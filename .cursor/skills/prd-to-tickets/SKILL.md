---
name: prd-to-tickets
description: Generates Jira-ready development tickets from a PRD as CSV. Use when the user says "break down PRD," "create tickets," "ticket breakdown," "decompose into tickets," "Jira tickets," or wants to turn a PRD into actionable engineering work.
---

# PRD to Jira Tickets

Act as a senior technical product manager generating development tickets from a PRD.

## How PRDs map to tickets

PRDs written to our template pre-define the ticket structure:

| PRD element | Becomes | Example |
|-------------|---------|---------|
| `###` requirement section | **Epic** | `### Domain setup` |
| `####` sub-section | **Ticket title** | `#### Domain entry form` |
| Bullets under `####` | **Description** (acceptance criteria) | `- Format validation before saving` |
| P0 / P1 labels | Inform **Priority** | P0 requirements → P0/P1 tickets; P1 → P1/P2 |

The agent's job is to **validate, size, add metadata** (story points, dependencies, priority), and verify MECE coverage — not to decompose or restructure what the PM already defined.

## Workflow

### Step 1: Read the PRD

Read the target PRD from `prds/`. If the user doesn't specify which PRD, ask.

#### Gather related context

Check for related material that could sharpen tickets:

- **`discovery/`** — edge cases, constraints, or user needs the PRD only summarizes. Informs better AC and clarifying questions.
- **Related PRDs in `prds/`** — shared components, existing data models, what's already built vs. new.
- **`products/`** — skim if unsure whether this is greenfield or extending existing work.

Don't read `strategy/` or `notes/` unless the PRD explicitly references them.

**The PRD is the source of truth.** Related context is supplementary — use it only to deepen understanding, never to expand scope. **Watch for unverified facts:** if the PRD references APIs, tables, org types, or other system artifacts as existing, verify they are confirmed as built in another doc. If they appear to be proposed or assumed, flag them as a clarifying question in Step 2 — do not carry unverified assumptions into ticket descriptions.

- If another doc contradicts the PRD, the PRD wins.
- Never generate a ticket for work that isn't traceable to a requirement, user flow, or constraint in the PRD.
- If related context surfaces something that _should_ be in scope but isn't in the PRD, raise it as a clarifying question — don't silently add tickets.

#### PRD sections that inform tickets (but aren't ticket sources)

| PRD section | How to use it |
|-------------|---------------|
| **User flows** (step tables) | Validate that the ticket set covers the full journey. Each "System does" cell should map to an existing `####` sub-section. If it doesn't, flag the gap. |
| **Out of scope** | Hard boundary. Never generate tickets for anything listed here. |
| **Open questions** | Surface as clarifying questions in Step 2. Don't ticket unresolved questions. |
| **Tech / constraints** | Guardrails and context that inform AC and descriptions. Cross-cutting constraints (e.g., "we never own the domain") belong here, not as separate tickets. |
| **Design / UX** | Check for links/descriptions. If missing or vague for UI-heavy sub-sections, ask for screenshots in Step 2. |
| **Ship by / Timeline** | Validate total story points fit. Flag mismatches. |

#### Imported PRDs

Some PRDs don't follow the template (e.g., numbered sections, no `####` sub-sections). For these, identify the requirement groups (→ Epics) and individual requirements (→ tickets) regardless of heading names, then group them into the same section → Epic, sub-section → ticket model.

### Step 2: Ask clarifying questions

Before generating tickets, identify ambiguities:

- **Unresolved open questions** from the PRD
- **Missing visual context** — request screenshots or designs for UI-heavy sub-sections
- **Unclear technical boundaries** — integration points, auth flows, third-party dependencies
- **Scope gray areas** — anything that could be in or out of scope
- **Sizing concerns** — any `####` sub-section that looks larger than 2 days of work

Do not guess. Ask, then proceed.

### Step 3: Generate tickets

Map the PRD structure to CSV:

- Each `###` section → Epic
- Each `####` sub-section → one row in the CSV
- Bullets under `####` → populate the Description field (optional one-sentence context + acceptance criteria)
- Add Story Points, Dependencies, and Priority as metadata

### Step 4: Verify coverage (MECE)

Produce three verification artifacts alongside the CSV — not optional.

#### 4a. Traceability matrix — collectively exhaustive

Map every PRD requirement, user flow step, and design element to the ticket that covers it.

```
| PRD Requirement / Flow Step / Design Element | Ticket(s) |
|----------------------------------------------|-----------|
| Validate domain format before saving | Domain entry form |
| Display DNS records with one-click copy | DNS records display |
| ... | ... |
```

**Rules:**
- Every row must have at least one ticket. Empty row = gap. Fix before delivering.
- Every ticket must appear in at least one row. Orphan ticket = scope creep. Remove it.
- Include user flow steps and design elements, not just requirement bullets.

#### 4b. Overlap audit — mutually exclusive

For every Epic, compare each pair of tickets and confirm scopes don't bleed.

```
**Domain entry form** vs **Domain management UI**
- Entry form owns: initial domain creation (wizard step 1)
- Management UI owns: post-setup settings, status display, removal
- Boundary: Entry creates the record; Management reads, displays, deletes
```

**Rules:**
- Check every pair within an Epic, not just ones that seem similar.
- If work could live in either ticket, assign to exactly one and note the decision.
- If scopes are clearly distinct within an Epic, state so.

#### 4c. Scope boundary check

List Out of Scope items that are _close_ to in-scope requirements, as a reminder they were intentionally excluded.

## Team context defaults

Use these unless the user specifies otherwise:

- **Team size:** 3 developers in parallel — minimize blocking between tickets
- **Developer seniority:** Mid-to-senior. Developers own technical implementation decisions. Tickets define requirements and done state, not how to build it.
- **Codebase state:** Greenfield — no components exist yet
- **Pace:** Move fast. Scope tightly.

## Sizing guidelines

| Rule | Target |
|------|--------|
| Story points | 1 point = 1 day of engineering work |
| Max per ticket | 2 story points. Anything larger must be split. |
| PR size | ~500–700 lines of code max |
| Granularity | Each `####` sub-section in the PRD should be ~1 day of work. If a sub-section looks bigger than 2 days, flag it and suggest the PM split it in the PRD. |

## MECE coverage

The ticket breakdown must be **mutually exclusive and collectively exhaustive** relative to the PRD and designs. This is the single most important quality bar.

- **Collectively exhaustive:** Every requirement, user flow step, and design element maps to a ticket. Every ticket maps back to a PRD requirement. Enforced by **traceability matrix** (Step 4a).
- **Mutually exclusive:** No two tickets own the same work. Enforced by **overlap audit** (Step 4b).

The CSV is incomplete without the Step 4 verification artifacts.

## Ticket ordering and grouping

1. Tickets grouped by Epic (matching PRD `###` section order)
2. Within each Epic, order by dependency chain — tickets with no dependencies first
3. Dependencies between tickets should be minimized; when unavoidable, call them out explicitly

## Priority levels

| Level | Meaning |
|-------|---------|
| P0 | Foundational or blocking — must be done before other work can start |
| P1 | Core feature — required for the product to function |
| P2 | Enhancement — improves experience but not strictly required |

## Output format

Produce a CSV inside a code block. Use multi-line, numbered acceptance criteria within quoted cells. This format is compatible with Jira CSV import (wrap multi-line content in double quotes) and Google Sheets File → Import.

```
Epic,Ticket Title,Description,Story Points,Dependencies,Priority
```

**Column rules:**

- **Epic** — the `###` requirement section name from the PRD
- **Ticket Title** — the `####` sub-section name from the PRD
- **Description** — optional one-sentence context line, followed by numbered acceptance criteria (one per line). Each criterion describes what's true when the ticket is done. Favor outcome-focused language. Carry forward PRD-mandated technical requirements, but don't prescribe implementation decisions the dev should own.
- **Story Points** — 1 or 2
- **Dependencies** — ticket titles that must be completed first, or "None"
- **Priority** — P0, P1, or P2

### Example row

```csv
Epic,Ticket Title,Description,Story Points,Dependencies,Priority
Domain setup,Domain entry & Vercel integration,"Wizard step 1 — establishes the domain connection and retrieves DNS config from Vercel.
1. Customer enters domain on Custom Domain step
2. Invalid formats show inline error
3. Valid domain persisted to sites.custom_url
4. Domain registered on Vercel project via API
5. A record IP + CNAME retrieved and available for Configure step
6. Wizard stepper shows progress across all steps",1,None,P0
```

## Quality checklist

Before delivering, verify:

- [ ] **Collectively exhaustive:** Traceability matrix has no empty rows. Every ticket appears in at least one row (no orphans).
- [ ] **Mutually exclusive:** Overlap audit covers every pair within each Epic. No shared work between tickets.
- [ ] Every ticket is 1–2 story points
- [ ] Dependencies are minimized for parallel work
- [ ] No ticket requires guessing at visual design — anything ambiguous was asked about in Step 2
- [ ] Tickets are grouped by Epic in PRD section order
- [ ] Descriptions are outcome-focused: optional one-sentence context + numbered, testable acceptance criteria (one per line).
- [ ] If the PRD has a Ship by / Timeline, total story points fit within available engineering days (team size × working days). Flag mismatches.
