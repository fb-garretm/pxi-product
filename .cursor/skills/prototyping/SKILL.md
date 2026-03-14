---
name: prototyping
description: Generates self-contained HTML prototypes from PRDs. Use when the user says "prototype this PRD," "make a prototype," "build a wireframe," "mock this up," or wants a clickable prototype someone can pull and open locally.
---

# PRD Prototyping

Generate clickable, modern-looking prototypes from PRDs — single HTML files that open directly in any browser.

## Before building

1. Read the target PRD in `prds/`.
2. Read `templates/prototype.html` — use it as the starting skeleton.
3. If the PRD references a discovery doc or design file that resolves ambiguity, read that too.

## Output files

- `prototypes/{feature-name}/index.html`
- `prototypes/{feature-name}/README.md`

## Design system

Every prototype uses the same visual system so they look consistent and production-grade. The template already has this baked in.

### Visual identity

- **Font**: Inter via Google Fonts CDN (falls back to system-ui).
- **Color approach**: monochrome (black primary button, white background) + status colors only where they carry meaning (green = success, amber = waiting, red = error). No decorative color.
- **Dark mode**: automatic via `prefers-color-scheme: dark` with a full dark palette in `:root`.
- **Borders**: 1px `#eaeaea` light / `#222` dark — hairline, not heavy.
- **Shadows**: very subtle (`0 1px 2px` to `0 8px 30px` range), never chunky.
- **Radius**: 8px for small elements, 12px for cards.
- **Typography**: 14px base, tight letter-spacing on headings (`-0.04em`), 28px page titles, 13px labels.

### Layout

- **Centered single column** (`max-width: 960px`) — not a sidebar layout.
- **Breadcrumb nav** at the top: logo placeholder + section / page.
- **Horizontal step indicator** below the nav showing numbered dots connected by lines. Active step is filled, completed steps show a checkmark.
- **Cards** for content groups: 1px border, 12px radius, optional header row with raised background.

### Components available in the template

| Component | Class / pattern | Use for |
|-----------|----------------|---------|
| Card | `.card`, `.card-header`, `.card-body` | Any grouped content |
| Form input | `.form-group`, `.form-input`, `.form-hint` | Text inputs, selects |
| Button | `.btn`, `.btn-primary`, `.btn-sm` | Actions |
| Status pill | `.pill`, `.pill-warning`, `.pill-success`, `.pill-neutral` | Inline status |
| Table | `<table>` inside `.table-wrap` | Data records |
| Code | `<code>` | Monospace values |
| Tab group | `.tab-group`, `.tab-btn` | Segmented selector (e.g. registrar) |
| Status block | `.status-block`, `.status-icon`, `.status-title` | Centered verification/success |
| Detail grid | `.detail-grid`, `.detail-cell` | Key-value row at bottom of card |
| Guide list | `.guide-list`, `.guide-num` | Numbered step-by-step instructions |

### Interactions

- `data-action="next"` / `data-action="prev"` on any button for screen navigation.
- Step dots are clickable for jumping.
- Completed steps show `✓` and green fill.
- Screens animate in with a subtle fade + 6px upward slide.
- Copy buttons flash "Copied!" then reset.

## How to map PRD content to screens

### Start with user flows

Each meaningful UI state becomes a screen. Skip "overview" — start at the first real action.

Common screen types:
- form entry
- configuration / decision
- pending / in-progress
- success / confirmation
- management / settings (if the PRD defines post-setup behavior)

### Use requirements to fill the screens

Requirements tell you what controls, fields, status indicators, validation messages, and CTAs belong on each screen. Do not invent features that aren't in the PRD. If the PRD references system artifacts (APIs, tables, org types) as existing but they aren't confirmed elsewhere in the repo, don't reinforce those assumptions in the prototype — use generic placeholder data instead.

### Use Design / UX as the brief

If the PRD calls for specific UI pieces (e.g. "registrar selector", "DNS records with copy"), build those directly using the components above.

### Write user-facing copy

All headings, labels, hints, and descriptions should read like real product copy — not PRD language. Rewrite technical descriptions into something a customer would read.

## Screen structure

Default structure unless the PRD clearly needs something else:

1. Primary entry (form, selection)
2. Configuration or decision (settings, options)
3. In-progress / pending state
4. Success / connected state

Short flows → fewer screens. Multi-branch flows → more screens.

## HTML rules

- Single self-contained HTML file, inline CSS and JS.
- **No** `package.json`, framework files, or build tooling.
- Inter via CDN is the only external request. If the user wants zero network, drop the font link — system-ui still looks good.
- Vanilla JS only. Keep interactions to screen switching, tab toggling, faux copy, and status changes.
- The prototype simulates behavior; it does not call real APIs.

## Naming

- Folder: `prototypes/{feature-name}/` in kebab-case.
- Normalize messy PRD filenames to a clean feature name.

## README

```markdown
# [Feature name] prototype

[One-line description of the flow.]

## Screens
1. [Screen name]
2. [Screen name]

## Notes
- [Assumption or gap]
```

## Quality bar

- [ ] Opens locally as `index.html` — no server needed
- [ ] Main user flow is represented end-to-end
- [ ] Major PRD requirements are visible in the UI
- [ ] Copy reads like a real product, not a PRD summary
- [ ] Dark mode works (check with OS toggle)
- [ ] README documents what the prototype covers

## Iteration

Update the existing prototype in place. Don't rebuild from scratch unless the user asks for a fundamentally different approach.
