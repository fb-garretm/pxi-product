---
name: analyzing-feedback
description: Synthesizes raw user feedback into structured insights. Use when the user shares feedback (notes, tickets, Slack messages, emails), says "analyze feedback," "synthesize feedback," "what are users saying," or asks to find patterns in user input.
---

# Analyzing Feedback

## Accepting input

Feedback comes in messy — conversation notes, support tickets, Slack threads, emails, feature requests, or a mix. Don't expect a clean format. Work with whatever is provided.

## How to analyze

1. **Read everything first.** Don't start grouping until you've seen all the input.
2. **Extract themes.** Group feedback by recurring patterns. Use rough frequency: "several users mentioned X," "one person flagged Y." Don't invent precision.
3. **Ground insights in quotes.** Pull actual quotes or close paraphrases from the source material. Themes without evidence are opinions.
4. **Flag outliers.** A single piece of feedback that doesn't fit a pattern can still be important — call it out separately.
5. **Call out gaps.** If the feedback only covers one persona, one use case, or one part of the product, say so. Name what you still don't know.

## Output format

Adapt based on what the user asks for:

**Themes summary** (default if no specific ask):
```
## Themes

### [Theme name]
_N mentions_

- "direct quote or paraphrase" — source
- "direct quote or paraphrase" — source

[repeat for each theme]

### Outliers
- ...

### Gaps
- What this feedback doesn't cover
```

**Seed a discovery doc:** Use the themes as Key Insights and Supporting Evidence in `templates/discovery.md`. Set Hypothesis based on the strongest pattern. Save in `discovery/`.

**Feed into a PRD:** Use themes to write the Problem section and inform requirements. Strongest themes become P0 requirements, secondary themes become P1. Use quotes in "How we'll know it worked" to phrase qualitative signals.

## Connecting to other docs

- If a related discovery doc exists in `discovery/`, check it for context and add to it rather than creating a duplicate.
- If a related PRD exists in `prds/`, reference it and note which themes support or challenge existing requirements.
- Link related docs: `[Discovery](../discovery/topic-name.md)` or `[PRD](../prds/feature-name.md)`.
