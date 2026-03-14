---
name: generating-insights
description: Synthesizes patterns, gaps, and strategic implications across the product repo. Use when the user says "generate insights," "what patterns do you see," "what should we build next," "what are we missing," or asks for cross-repo analysis.
---

# Generating Insights

## Before responding

Read broadly across the repo first. Check all of these before forming any conclusions:

- `prds/` — what's been specced, what's in progress
- `discovery/` — research findings, feedback analyses, exploration
- Any other docs the user points to

Don't generate insights from a single doc — the value is in cross-referencing.

## Three types of insights

### Patterns
Themes that show up across multiple docs. Name the pattern, cite which docs support it, and note frequency.

Example: "Onboarding friction appears in 3 discovery docs and is referenced in the checkout-flow PRD. It's the most recurring theme across the repo."

### Gaps
- Problems mentioned in discovery that have no corresponding PRD
- PRDs with thin or no discovery backing them
- User needs that appear in feedback but haven't made it into either

### Contradictions
Places where docs disagree or assumptions conflict. Don't resolve them — surface them so the team can decide.

Example: "The pricing-discovery doc recommends simplifying tiers, but the pricing PRD adds a new enterprise tier."

## Going deeper on a topic

When the user asks about a specific area, pull everything relevant from across the repo and synthesize. Don't just summarize each doc — connect them.

## Strategic implications

When asked "what should we build next" or "what are we overlooking":

- Rank by evidence weight — themes backed by multiple docs and sources rank higher
- Call out what has strong evidence but no action (no PRD, no next steps)
- Call out what's being built with weak evidence (PRD exists but discovery is thin)

## Output

- **Chat response** for quick asks or when the user just wants to talk it through.
- **Standalone doc** saved in `discovery/` when the analysis is substantial enough to reference later. Use kebab-case: `cross-repo-insights-[topic].md`.

## No unverified facts

When synthesizing across docs, do not state that APIs, tables, schema fields, org types, or other system artifacts exist unless a doc explicitly describes them as shipped or built. PRDs describe what *will* be built — not what exists today. If an insight depends on a system capability, verify it's confirmed as built before stating it as fact. When uncertain, flag it as an assumption.

## Always cite sources

Every insight must link to the docs that support it. Use relative links: `[doc name](../prds/feature-name.md)` or `[doc name](../discovery/topic-name.md)`.
