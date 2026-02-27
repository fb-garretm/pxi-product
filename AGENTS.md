# AGENTS.md

## Cursor Cloud specific instructions

This repository (`pxi-product`) is currently an empty project scaffold with only a `README.md`. There are no application services, dependencies, build systems, or test frameworks configured yet.

### Current state
- **No source code** — no application, library, or service code exists.
- **No package manager** — no `package.json`, `requirements.txt`, `go.mod`, or equivalent.
- **No build/test/lint tooling** — no scripts, Makefile, or CI configuration.
- **No Docker or container setup** — no `Dockerfile` or `docker-compose.yml`.

### Notes for future agents
- Once application code is added, update this file with service descriptions, startup commands, and testing instructions.
- If the project uses JavaScript/TypeScript, check for a lockfile to determine the correct package manager (`npm`, `yarn`, `pnpm`, or `bun`).
- The workspace rule references "FB Toolkit" and "Shadcn Forms" — these should be used when building UI components.
