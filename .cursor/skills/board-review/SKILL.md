---
name: board-review
description: Runs a multi-perspective board review of a document using role-based agents. Supports board review, discovery mode, re-review, and pulse check formats. Use when the user says "board review," "run board review," "review board," "cross-functional review," "run discovery mode," "discovery review," "analyze this," "re-review," "review again," or "pulse check."
---

# Board Review Orchestrator

This skill orchestrates multi-perspective reviews by running role-based agents against a document. It supports four modes: Board Review (default), Discovery Mode, Re-review, and Pulse Check.

## Available agents

| Agent | Skill path | Lens |
|-------|-----------|------|
| Senior Product Designer | `review-as-designer` | UX, interaction patterns, accessibility, design consistency |
| Senior Development Lead | `review-as-dev-lead` | Technical feasibility, architecture, scalability, security |
| General Counsel | `review-as-counsel` | Legal compliance, liability, data privacy, regulatory risk |
| Devil's Advocate | `review-as-devils-advocate` | Assumptions, blind spots, failure modes, opportunity costs |
| Tournament Operator | `review-as-operator` | Day-of-event ops, admin burden, staff usability, ROI |
| Coach | `review-as-coach` | Team management, schedule access, parent comms, game-day needs |
| Parent | `review-as-parent` | Schedule reliability, payments, multi-child logistics, trust |
| Athlete | `review-as-athlete` | Social connection, simplicity, cool factor, engagement |
| CEO | `review-as-ceo` | Business viability, market positioning, revenue, strategy |
| CTO | `review-as-cto` | Platform strategy, product-tech intersection, build vs. buy |
| GM, PXI | `review-as-gm` | Portfolio P&L, cross-product strategy, team execution |
| Product Director, PXI | `review-as-product-director` | Product craft, requirements quality, success metrics, sequencing |

## Step 1: Read context

1. Read `.cursor/skills/_shared/fastbreak-context.md` for shared product context.
2. Read the document the user wants reviewed. If none is specified, ask which document to review.

## Step 2: Cross-document scan

Check the repo for documents related to the one under review:
- Search `prds/`, `discovery/`, `notes/`, `products/`, and `strategy/` for documents that reference the same product, user type, or feature area.
- Use explicit signals: product names mentioned in the doc, direct links to other docs, shared user types, and folder proximity.
- Summarize only key decisions, scope boundaries, and dependencies from related docs — not full content. Present this as a brief that agents can reference.
- Example: "Custom Apps PRD scopes push notifications as P1. Club PRD defines the roster entity this depends on. Discovery doc found coaches want offline access."

## Step 3: Determine mode

Based on the user's request, select the mode:

- **Board Review** (default): Critique a structured document (PRD, strategy doc, plan). Agents evaluate quality, completeness, and risks.
- **Discovery Mode**: Process raw input (notes, interviews, research, feedback). Agents extract signal and surface patterns.
- **Re-review**: Review a revised document against a previous review. Agents track resolution of prior concerns.
- **Pulse Check**: Ultra-light assessment for early drafts. Quick multi-perspective signal, no full agent reviews.

## Step 4: Triage

Analyze the document type, subject matter, and content, then recommend whichever agents are most relevant — could be 2, could be 8. For each recommended agent, give a brief rationale for inclusion.

Present the recommendation to the user and let them adjust (add/remove agents) before proceeding. The user can also say "run all" to override triage.

**Triage logic by mode:**
- **Board Review / Re-review**: "Which agents have a relevant perspective on this document type and content?"
- **Discovery Mode**: "Which agents' lenses are likely to see signal in this type of input?"
- **Pulse Check**: Run all triaged agents in compressed mode (no user adjustment needed — speed is the priority).

## Step 5: Run the review

Execute the selected mode using the instructions below.

---

## Mode: Board Review (default)

### Output structure

**PART 1: Synthesis** (always first — most important section)

A reader should be able to stop after Part 1 and know exactly what to do.

- **Overall Signal**: One sentence. Is this ready, almost ready, or needs work?
- **Consensus Issues**: Only issues flagged by 2+ agents. For each:
  - The issue (one sentence)
  - Which agents flagged it
  - Recommended action
- **Productive Tensions**: Where agents disagree and the team must make a deliberate call. For each:
  - The tension (one sentence)
  - Agent A's position vs. Agent B's position
  - What the tradeoff actually is
- **Biggest Blind Spot**: The single most important thing the document doesn't address.
- **Open Questions**: The most important questions surfaced across all agents. Deduplicated and consolidated — if multiple agents asked variants of the same question, combine them and note who asked. Max 5-7.
- **Recommended Next Steps**: Ordered. Max 5. Each one actionable. These are strategic and process-oriented ("Resolve the COPPA question with legal," "Schedule a design review").
- **Action Items**: A concrete checklist of specific *document edits* the author should make, derived directly from agent feedback. Each item references the source agent and the exact section it applies to. Ordered by priority. These are tactical ("Add parental consent flow to Section 3.2," "Clarify whether offline mode is P0 or P1 in Section 4.1").

**PART 2: Agent Reviews** (sorted by severity)

Agents self-determine depth based on how much they have to say about THIS specific document.

Severity indicators:
- 🟢 = 4-5 (strong from their perspective)
- 🟡 = 2.5-3.5 (concerns but workable)
- 🔴 = 1-2 (significant issues from their perspective)

Depth templates:

🟢 (one line):
`[Agent Name] [🟢 rating/5] — Nothing material from my lens. [Optional one sentence.]`

🟡 (compact):
```
[Agent Name] [🟡 rating/5]
Top concern: [1-2 sentences]
Key question: [One question]
[Optional: 1-2 additional sentences of context]
```

🔴 (expanded):
```
[Agent Name] [🔴 rating/5]
Top concern: [1-2 sentences]
Why this matters: [2-4 sentences — specific, referencing exact sections/gaps]
Key question: [One question]
Suggested fix: [Concrete recommendation]
```

Questions: 🟡 and 🔴 agents include their key question inline. 🟢 agents can optionally include a question if worth raising. The Synthesis pulls the most important cross-cutting questions into the consolidated Open Questions list.

Sorting order: All 🔴 agents first (most critical first), then all 🟡 agents, then all 🟢 agents (compressed into a single block at the end).

### Board review rules

- Synthesis comes first, always.
- Default to concise. Brevity is the baseline — agents say what matters and stop. But when an agent has a critical flag, a nuanced concern, or something that genuinely requires explanation, give them room. The goal is signal density, not word count minimization.
- Agents earn their space. No padding. One line is enough if an agent has nothing to add. But a 🔴 agent with a complex issue should never feel truncated.
- Be specific. Reference exact sections, requirements, user types, or gaps — never stay abstract.
- Agents stay in character. The Operator talks like an operator. The Parent talks like a parent. Don't homogenize voices.
- Don't smooth over conflict. If the CEO loves it and the Devil's Advocate thinks it's the wrong bet, say so.
- Green agents go fast. Cluster all 🟢 agents together at the end.

---

## Mode: Discovery

Triggered by "run discovery mode," "discovery review," "analyze this," or similar. Used for raw notes, interview transcripts, research findings, competitor analysis, user feedback, or any unstructured input.

The goal is NOT to critique a plan. The goal is to extract signal, surface patterns, and shape what comes next. Agents ask "what do I see in this that matters for my domain?" — they are pattern-finders and signal-extractors, not critics.

### Output structure

**PART 1: Signal Map** (start here)

- **Input Characterization**: One sentence on what this input is (e.g., "5 operator interviews from mid-market tournament directors") and an explicit note on whose perspectives are present and absent in the data.
- **Top Patterns**: Themes that emerged across multiple agents. For each: the pattern (one sentence), which agents flagged it, and supporting evidence from the source material.
- **Contradictions in the Data**: Where the input says two conflicting things. For each: the contradiction, the competing data points, and what it means for decision-making.
- **Biggest Gap**: What the data doesn't cover — what question wasn't asked, who wasn't interviewed, what assumption remains untested.
- **Open Questions**: The most important questions the input raises but doesn't answer. Deduplicated across agents, attributed.
- **Confidence Level**: How confident is the board in these findings? Rate per finding based on input quantity, quality, and diversity. Note what would increase confidence (e.g., "High confidence on the schedule-change pain point — 4 of 5 operators raised it independently. Low confidence on pricing willingness — only one mention, needs dedicated research.").
- **Convergence Call**: An opinionated recommendation — commit to a position, don't hedge:
  - What's ready to move to a PRD?
  - What needs more research or a follow-up discovery?
  - What assumptions need validation before proceeding?
  - What looks like a dead end based on the data?

**PART 2: Agent Perspectives** (sorted by signal strength — agents with the most to say go first)

The following sections are a menu, not a checklist. High-signal agents use whichever sections apply and expand as needed. Moderate-signal agents might have one pattern and one question. Minimal-signal agents compress to one line and cluster at the end.

Available sections per agent:
- **Key patterns**: What they see in the data from their perspective
- **Signals worth tracking**: Things that aren't patterns yet but could become important
- **What they'd want to learn next**: Specific follow-up questions for their domain
- **Connection to existing work**: How this relates to current PRDs, discovery docs, or strategy in the repo

### Discovery mode rules

- **Evidence anchoring**: Agents must ground claims in specific evidence from the input. Don't say "coaches want offline access" — say "Coach 3 mentioned checking schedules in a gym with no WiFi; Coach 1 described printing paper brackets as a fallback." Claims without traceable evidence get flagged as assumptions, not findings.
- Cross-document scan still runs — connecting raw findings to existing PRDs and discovery docs is high-value.
- Distinct from the existing `analyzing-feedback` and `generating-insights` skills, which are single-perspective. Discovery mode is multi-perspective analysis through all 12 lenses.

---

## Mode: Re-review

Triggered when the user says "re-review," "review again," or references a previously reviewed document.

### Workflow

1. Look in `.cursor/reviews/` for the most recent review of the same document. If not found, ask the user to provide the previous review.
2. Read the current version of the document alongside the previous review.
3. Returning agents focus on whether their previously flagged concerns were addressed, rather than reviewing from scratch. Agents that weren't in the original review do a fresh pass.
4. Each returning agent reports one of:
   - **Resolved** — concern addressed
   - **Partially Resolved** — improved but still incomplete
   - **Unresolved** — not addressed
   - **New Concern** — something introduced by the revision
5. Synthesis highlights what's been fixed, what's still open, and any new issues introduced by the changes.

---

## Mode: Pulse Check

Triggered by "pulse check" or "quick check." Ultra-light format for early drafts.

### Workflow

Run all triaged agents in compressed mode (signal + top concern only, no full reviews). No user triage adjustment — speed is the priority.

### Output structure

- **Overall Signal**: One sentence. Where does this draft stand?
- **Top 3 Concerns**: One sentence each, with source agent.
- **Biggest Question**: The single most important question this draft raises.
- **Suggested Focus Areas**: Where the author should focus energy for the next revision. Max 3.

The entire output should be compact — optimized for a quick read, not a deep analysis.

---

## Alternative formats (user can request for Board Review mode)

If the user requests a different output format, use one of these instead of the default Board Review structure:

- **Scorecard**: Each reviewer rates key dimensions (Feasibility, UX Quality, Legal Risk, Strategic Alignment, User Value) on a 1-5 scale with brief justification per dimension. Compact grid format.
- **Simulated Conversation**: Personas debate the document in a realistic cross-functional meeting format, surfacing tensions and trade-offs naturally through dialogue. Agents stay in character.
- **Inline Annotations**: Agent comments embedded directly into the source document at the relevant sections. Each annotation is prefixed with the agent name and severity indicator (e.g., `<!-- [Dev Lead 🔴] ... -->`). Best for PRDs with numbered requirements.

---

## Auto-save

After every review (any mode), write the full output to `.cursor/reviews/`:
- Board Review: `{doc-name}-review-{YYYY-MM-DD}.md`
- Discovery: `{input-name}-discovery-{YYYY-MM-DD}.md`
- Re-review: `{doc-name}-re-review-{YYYY-MM-DD}.md`
- Pulse Check: `{doc-name}-pulse-{YYYY-MM-DD}.md`

This enables re-review mode and creates a persistent reference for future PRD writing.
