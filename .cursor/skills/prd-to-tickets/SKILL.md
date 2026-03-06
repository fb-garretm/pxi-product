---
name: prd-to-tickets
description: Decomposes a PRD into Jira-ready development tickets output as CSV. Use when the user says "break down PRD," "create tickets," "ticket breakdown," "decompose into tickets," "Jira tickets," or wants to turn a PRD into actionable engineering work.
---

# PRD to Jira Tickets

Act as a senior technical product manager decomposing a PRD into actionable engineering tickets.

## Workflow

### Step 1: Read the PRD

Read the target PRD from `prds/`. If the user doesn't specify which PRD, ask. Also read `templates/prd.md` if you haven't already — it defines the canonical section structure.

#### Gather related context

After reading the PRD, check for related material in the repo that could sharpen tickets:

- **`discovery/`** — Research, user feedback, or competitive analysis for this topic. Often reveals edge cases, constraints, or user needs the PRD only summarizes. Use to write better acceptance criteria and inform clarifying questions.
- **Related PRDs in `prds/`** — If the PRD references or builds on another feature, read it to understand shared components, existing data models, and what's already been built vs. what's new.
- **`products/`** — Skim if unsure whether this is truly greenfield or an extension of existing work. Product overviews clarify what already exists.

Don't read `strategy/` or `notes/` unless the PRD explicitly references them.

**The PRD is the source of truth.** Related context is supplementary — use it only to deepen understanding of what the PRD already says, never to expand scope. Specifically:

- If discovery or another doc contradicts the PRD, the PRD wins.
- Never generate a ticket for work that isn't traceable to a requirement, user flow, or constraint in the PRD.
- If related context surfaces something that _should_ be in scope but isn't in the PRD, raise it as a clarifying question in Step 2 — don't silently add tickets for it.

#### Mapping PRD sections to tickets

PRDs that follow the template have sections that map directly to ticket generation:

| PRD section | How to use it |
|-------------|---------------|
| **Requirements** (grouped by theme, P0/P1) | Primary source for tickets. Each requirement group becomes an Epic or sub-epic. P0 requirements produce P0/P1 tickets; P1 requirements produce P1/P2 tickets. |
| **User flows** (step tables) | Define end-to-end journeys. Use to identify the full chain of tickets needed and their dependencies. Each "System does" cell often implies a distinct ticket. |
| **Out of scope** | Hard boundary. Never generate tickets for anything listed here. |
| **Open questions** | Surface these as clarifying questions in Step 2. Don't generate tickets around unresolved questions without asking first. |
| **Tech / constraints** | Informs foundational tickets — data models, API constraints, third-party integrations, "don't do X" guardrails. |
| **Design / UX** | Check if links or descriptions exist. If missing or vague for UI-heavy requirements, ask for screenshots/mocks in Step 2. |
| **Ship by / Timeline** | Use to validate that total story points fit the timeline. Flag if they don't. |

#### Imported PRDs

Some PRDs in the repo are imported documents that don't follow the template (e.g., numbered sections like "Functional Requirements," "Technical Notes"). For these, map the content to the same concepts — find the requirements, constraints, scope boundaries, and open questions regardless of heading names.

### Step 2: Ask clarifying questions

Before generating any tickets, identify ambiguities:

- **Underspecified requirements** — vague acceptance criteria, missing edge cases, unclear data models
- **Missing visual context** — request screenshots or design references for any UI-heavy work where layout, spacing, or interaction patterns aren't described in the PRD
- **Unclear technical boundaries** — integration points, auth flows, third-party dependencies
- **Scope gray areas** — anything that could be interpreted as in or out of scope

Do not guess at implementation details. Ask, then proceed.

### Step 3: Generate tickets

After clarifying questions are answered, produce the full ticket breakdown as CSV.

## Team context defaults

Use these unless the user specifies otherwise:

- **Team size:** 3 developers working in parallel — tickets should be as independent as possible to minimize blocking
- **Codebase state:** Greenfield — no components exist yet
- **Pace:** Move fast. Scope each ticket tightly.

## Sizing guidelines

| Rule | Target |
|------|--------|
| Story points | 1 point = 1 day of engineering work |
| Max per ticket | 2 story points. Anything larger must be split. |
| PR size | ~500–700 lines of code max |
| Granularity floor | Don't over-decompose. Good: "Build the Event Card Component." Bad: "Create the event card container div." |

## Ticket ordering and grouping

1. **Foundational work first** — data models, API scaffolding, navigation shell, auth
2. **Shared/reusable components** get their own tickets (e.g., search bar, bottom nav, shared UI primitives)
3. **Feature tickets** grouped by Epic
4. **Dependencies between tickets should be minimized** — when unavoidable, call them out explicitly

## Priority levels

| Level | Meaning |
|-------|---------|
| P0 | Foundational or blocking — must be done before other work can start |
| P1 | Core feature — required for the product to function |
| P2 | Enhancement — improves experience but not strictly required |

## Output format

Produce a CSV inside a code block with these columns:

```
Epic,Ticket Title,Description,Acceptance Criteria,Story Points,Dependencies,Priority
```

**Column rules:**

- **Epic** — the feature area or product section
- **Ticket Title** — concise, action-oriented (e.g., "Build Event Card Component")
- **Description** — bulleted summary of work scope. Use bullets for multiple discrete items or acceptance criteria. Use prose only if a single sentence captures it fully.
- **Acceptance Criteria** — bulleted list of specific, testable conditions that must be met for the ticket to be done
- **Story Points** — 1 or 2
- **Dependencies** — ticket titles that must be completed first, or "None"
- **Priority** — P0, P1, or P2

### Example row

```csv
Epic,Ticket Title,Description,Acceptance Criteria,Story Points,Dependencies,Priority
Events,Build Event Card Component,"• Display event name, date, location, and thumbnail image
• Tap navigates to event detail screen
• Handle missing image gracefully with fallback","• Card renders all required fields from API response
• Tapping card navigates to correct detail screen
• Missing image shows placeholder without layout shift",1,Build Event List API Endpoint,P1
```

## Quality checklist

Before delivering, verify:

- [ ] Every ticket is 1–2 story points
- [ ] Foundational/scaffolding tickets come first and are marked P0
- [ ] Shared components are broken out as standalone tickets
- [ ] Dependencies are minimized for parallel work across 3 devs
- [ ] No ticket requires guessing at visual design — anything ambiguous was asked about in Step 2
- [ ] Tickets are grouped by Epic
- [ ] Acceptance criteria are specific and testable
- [ ] If the PRD has a Ship by date or Timeline, total story points fit within the available engineering days (team size × working days). Flag mismatches.
