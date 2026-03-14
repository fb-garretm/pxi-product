---
name: writing-prds
description: Drafts and edits Product Requirements Documents following team conventions. Use when creating a PRD, editing files in prds/, or when the user says "write a PRD," "draft requirements," or "new feature doc."
---

# Writing PRDs

## Before writing

1. Read `templates/prd.md` — use it as the starting structure for every new PRD.
2. Check `discovery/` for any related research. If a discovery doc exists for this topic, read it and use its insights to inform the Problem, requirements, and success signals.

## No unverified facts

Never reference APIs, database tables, schema fields, organization types, data models, services, or other system artifacts as existing unless another document in this repo explicitly describes them as shipped or built — not just proposed. If you're unsure whether something exists, ask the user before writing it as fact.

When a PRD needs to reference something that doesn't exist yet, clearly mark it:
- Use **"New"** or **"Proposed"** labels (the PRD already uses "New" vs. "From OSS" — follow that pattern).
- For data points, APIs, or tables: say "to be created" or "does not exist yet" rather than writing as if they're already in the system.
- If a requirement depends on an unconfirmed system artifact, flag it as an open question rather than baking the assumption into requirements.

This prevents downstream work (tickets, prototypes, engineering) from building on things that don't exist.

## Conventions

- **Section order matters.** Ship by and Design/UX come first, right after the title.
- **User flows** (optional): When the feature has multiple paths, phases, or user journeys, add a **User flows** section after Design/UX. For each flow use a step-by-step table with columns **Step**, **Customer does**, **System does**, and end with **Outcome:** one line stating what's true when the flow is done. Order flows in ship sequence (e.g. crawl → walk → power walk). This makes it clear who does what at each step.
- **"What & why"** is one sentence. Not a paragraph.
- **"How we'll know it worked"** must be qualitative — observable signals like "users stop asking for X" or "we can do Y without the workaround." No analytics, no dashboards, no metrics tables.
- **"Out of scope"** is required, not optional. Every PRD needs it.
- **Language** is concise and direct. No filler, no corporate speak.

## Requirements structure

Requirements are structured to map directly to Jira Epics and tickets:

- **`###` sections = Epics.** Each section is a product area that a developer could own end-to-end. Name it as a work area, not a description. Good: "Schedule tab," "Domain setup." Bad: "Dynamic Content Display Requirements," "Cross-cutting."
- **`####` sub-sections = tickets.** Each sub-section is roughly one day of shippable work. It's the smallest slice that's still meaningful — something a dev can pick up, PR by end of day, and a reviewer can understand in one sitting.
- **Bullets under `####` = requirements** that become the ticket's description and acceptance criteria. State what must be true when the work is done.
- **P0 / P1** labels apply to individual sub-sections or bullets, not to entire sections. P0 = must ship. P1 = in scope if we have time. No P2.

### Grouping principles

- **Group by product area, not technical layer.** An Epic includes whatever backend, frontend, and data work is needed for that area to function. "Domain setup" includes the form, the API integration, and the routing — because those are all part of making domain setup work.
- **Each section should pass the "Dev A owns X" test.** If you can say "Dev A owns Domain setup" and they know their swim lane, the grouping is right.
- **No container headers.** If sub-sections under a heading are each independently buildable by different people, they should be top-level `###` sections, not nested under a parent. Good: `### Registration tab`, `### Schedule tab` as siblings. Bad: `### Internal Events` with `#### Registration tab`, `#### Schedule tab` underneath.
- **Cross-cutting constraints are not Epics.** "We never own the domain" or "must be responsive" are guardrails — they belong in **Tech / constraints** as context every dev references, or as bullets within the specific tickets they apply to. Don't create a requirements section for them.
- **Phases are annotations, not groupings.** If the product ships in phases (crawl/walk/run), organize sections by work area and annotate sub-sections with which phase they ship in. This avoids duplicating shared requirements across phase sections.

### Sizing sub-sections

Each `####` sub-section should represent roughly 1 day of engineering work (max 2 days). If a sub-section feels larger:

- Split it into two sub-sections within the same `###` section.
- If it can't be split meaningfully, it might be two separate product areas — consider whether the `###` section needs to be split instead.

### Example

```markdown
## Requirements

### Domain setup

#### Domain entry form
- Customer enters their domain
- Format validation before saving
- Persist to sites.custom_url

#### Vercel domain registration
- Register domain on Vercel project via Vercel API
- GET config: retrieve A record IP + CNAME value

#### Domain routing middleware
- Match request Host against sites.custom_url
- Serve correct site data for matched domain

### DNS guidance

#### DNS records display
- Show A record + CNAME with one-click copy
- Values sourced from Vercel config response

#### Registrar-specific guides
- "Which registrar?" selector (GoDaddy, Namecheap, etc.)
- Step-by-step instructions per registrar
```

## File placement

- Save PRDs in `prds/` with kebab-case names: `feature-name.md`.
- If a related discovery doc exists, link to it: `[Discovery](../discovery/topic-name.md)`.

## When editing an existing PRD

Preserve existing content unless explicitly told to remove it. Refine, restructure, or add — don't delete without being asked.
