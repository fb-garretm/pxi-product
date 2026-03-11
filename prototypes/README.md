# Prototypes

This folder contains interactive wireframe prototypes generated from PRDs in this repo.

## How to view

Open any `prototypes/<feature-name>/index.html` file in a browser. No install, build step, or local server is required.

## How to generate

Ask Cursor to prototype a PRD, for example:

- `Prototype prds/custom-domains.md`
- `Build a wireframe prototype for prds/Custom Domains PRD.md`

The prototyping workflow is defined in `.cursor/skills/prototyping/SKILL.md`.

## What to expect

- Single-file HTML prototypes with inline CSS and JavaScript
- Wireframe-style UI by default
- Simulated interactions for flows, steps, tabs, and status changes
- Companion README files describing scope and assumptions

## Working agreement

Treat prototypes as product artifacts, not production code. Prefer regenerating or iterating from the PRD rather than hand-building a mini app.
