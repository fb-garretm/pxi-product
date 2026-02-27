---
name: generate-ai-context
description: Packages product knowledge into dense, portable context for use by AI agents in other repos or conversations. Use when the user says "generate context," "create a brief," "what does an agent need to know about X," or needs to export product knowledge for use elsewhere.
---

# Generate AI Context

## Purpose

Take scattered product knowledge from this repo and compress it into a single context block optimized for an AI to consume — not a human-readable doc, but a dense, structured briefing that gives another agent exactly what it needs.

## Before generating

Read everything relevant to the topic across the repo:

- `prds/` — requirements, scope, constraints, what's out of scope
- `discovery/` — research findings, user feedback, hypotheses
- Any other docs the user points to

Ask the user what the context is for if it's not obvious. The destination shapes what to include.

## How to structure the context

```
# Context: [Topic]

## What we're building
[One paragraph. Plain language.]

## Why
[The problem, who has it, what happens without this.]

## Requirements
[P0s only unless the user asks for more. Grouped by theme.]

## Constraints
[Technical limits, dependencies, "don't do X."]

## Key decisions already made
[Anything the receiving agent shouldn't re-litigate.]

## What we learned from users
[Compressed findings from discovery/feedback. Include quotes that matter.]

## Open questions
[Unresolved items the receiving agent should be aware of.]

## Sources
[Links back to docs in this repo.]
```

Adapt this structure — drop sections that don't apply, add sections if the destination needs them (e.g. "API contracts" for an engineering context, "user personas" for a design context).

## Optimization for AI consumption

- **Dense, not verbose.** Every sentence should carry information. No preamble, no filler.
- **Structured with clear headers.** AI agents parse structure well.
- **Include quotes and specifics** over generalizations. "Users said checkout takes 4 clicks too many" beats "users find checkout cumbersome."
- **State decisions as facts**, not options. The receiving agent should build on decisions, not re-make them.
- **Flag uncertainty explicitly.** If something is unresolved, say so — don't let the receiving agent assume it's decided.

## Output

- **Chat response** for quick or one-off asks.
- **Saved file** when the user wants to keep it or reuse it. Save in `context/` with kebab-case: `context/checkout-flow.md`. Create the `context/` folder if it doesn't exist.

## Always cite sources

End with a Sources section linking back to the docs in this repo that the context was built from.
