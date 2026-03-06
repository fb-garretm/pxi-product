# Board Review — Usage Guide

A multi-perspective review system that simulates a cross-functional team evaluating your documents through 12 role-based agents.

## Quick start

| What you want | What to say |
|---------------|-------------|
| Full board review of a PRD | "Run a board review on `prds/custom-apps-prd-v1.md`" |
| Quick signal on an early draft | "Pulse check on `prds/oss-template-prd.md`" |
| Extract patterns from raw notes | "Run discovery mode on these interview notes" |
| Re-review after revisions | "Re-review `prds/club-prd.md`" |
| Single agent perspective | "Review as parent" or "Review as dev lead" |

## Modes

### Board Review (default)

Full cross-functional review of a structured document (PRD, strategy doc, plan).

**Output:**
1. **Synthesis** — overall signal, consensus issues, productive tensions, blind spots, open questions, next steps, and action items. Read this first — you can stop here and know what to do.
2. **Agent Reviews** — sorted by severity (🔴 critical → 🟡 concerns → 🟢 solid). Agents expand or compress based on how much they have to say.

**Trigger phrases:** "board review," "run board review," "cross-functional review"

### Discovery Mode

Process raw, unstructured input — interview transcripts, research findings, competitor analysis, feedback dumps, meeting notes. Agents extract signal and surface patterns instead of critiquing a plan.

**Output:**
1. **Signal Map** — input characterization, top patterns with evidence, contradictions, gaps, confidence levels, and a convergence call on what to do next.
2. **Agent Perspectives** — what each agent sees from their lens, grounded in specific evidence from the input.

**Trigger phrases:** "run discovery mode," "discovery review," "analyze this"

### Re-review

Review a revised document against a previous review. Agents track whether prior concerns were resolved.

Each returning agent reports: **Resolved**, **Partially Resolved**, **Unresolved**, or **New Concern**.

Requires a previous review saved in `.cursor/reviews/`. Reviews are auto-saved after every run.

**Trigger phrases:** "re-review," "review again"

### Pulse Check

Ultra-light assessment for early drafts. Returns overall signal, top 3 concerns, biggest question, and suggested focus areas — all in a compact read.

**Trigger phrases:** "pulse check," "quick check"

## Alternative output formats

For Board Review mode, you can request a different format:

| Format | When to use | How to request |
|--------|-------------|----------------|
| **Scorecard** | Compare dimensions at a glance | "Run a board review as a scorecard" |
| **Simulated Conversation** | See agents debate tradeoffs naturally | "Run a board review as a conversation" |
| **Inline Annotations** | Anchor feedback to specific sections | "Run a board review with inline annotations" |

## Triage

Before running, the orchestrator reads your document and recommends which agents are most relevant. You can:
- **Accept** the recommendation as-is
- **Add or remove** specific agents
- Say **"run all"** to include all 12

## The 12 agents

### Internal team

| Agent | Lens | Best for |
|-------|------|----------|
| **Senior Product Designer** | UX, flows, accessibility, design consistency | PRDs with user-facing features |
| **Senior Development Lead** | Feasibility, architecture, scalability, security | PRDs with technical scope |
| **General Counsel** | Legal, COPPA, liability, data privacy | Anything involving minors, payments, or data |
| **Devil's Advocate** | Assumptions, blind spots, failure modes | Everything — stress-tests any document |
| **Product Director, PXI** | Requirements quality, problem framing, success metrics | PRDs and strategy docs |

### End users

| Agent | Lens | Best for |
|-------|------|----------|
| **Tournament Operator** | Day-of-event ops, admin burden, staff usability | Operator-facing features, event tools |
| **Coach** | Schedule access, team management, parent comms | Team/schedule/communication features |
| **Parent** | Schedule reliability, payments, multi-child logistics | Family-facing features, notifications, payments |
| **Athlete** | Social connection, simplicity, cool factor | App features, engagement, social features |

### Leadership

| Agent | Lens | Best for |
|-------|------|----------|
| **CEO** | Business viability, market positioning, revenue | Strategy docs, new product areas |
| **CTO** | Platform strategy, build vs. buy, team capacity | Architecture decisions, cross-product features |
| **GM, PXI** | Portfolio fit, resource allocation, execution risk | Anything competing for team bandwidth |

## Individual agent reviews

You can invoke any single agent directly without running the full board:

- "Review as parent" — single perspective, adaptive depth
- "What would a coach think about this?" — same thing, natural language
- "Review as devil's advocate" — stress-test a specific document

Solo agents adapt their output: compact if it's a quick take, expanded if they have significant concerns.

## How reviews are saved

Every review auto-saves to `.cursor/reviews/` with the naming convention:

```
{doc-name}-review-2026-03-06.md      # Board Review
{doc-name}-pulse-2026-03-06.md       # Pulse Check
{input-name}-discovery-2026-03-06.md  # Discovery
{doc-name}-re-review-2026-03-06.md   # Re-review
```

This enables re-review mode and creates a reference trail for future work.

## Tips

- **Start with a pulse check** on early drafts, then run a full board review when the doc is more developed.
- **Use discovery mode** before writing a PRD — feed it your raw research and let the board help you find the signal.
- **Re-review after major revisions** to track which concerns you've addressed and what's still open.
- **Invoke individual agents** when you want a specific perspective without the full board overhead (e.g., "review as counsel" before shipping anything involving minors' data).
- **The synthesis is the most important section.** If you only read one thing, read Part 1.
