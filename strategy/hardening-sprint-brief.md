# Hardening Sprint Brief — Event Directory, CMS & OSS

| Field | Value |
|-------|--------|
| Source | [Jira.csv](../Jira.csv) |
| Imported | 2026-03-09 |

---

## Sprint overview

Hardening sprint for the recently developed **public event directory**, **CMS**, and **Operator Standard Site (OSS)**. Focus: stability, polish, and final touches before release.

**Related PRDs:** [Event Directory](prds/swoop-event-directory-prd.md) · [CMS V0](prds/cms-v0-prd.md) · [OSS](prds/oss-template-prd.md)

---

## Sprint goals

- Ship all P0 (must-have) items so Event Directory, CMS, and OSS are release-ready.
- Address P1 (nice-to-have) polish and UX where capacity allows.
- No critical regressions; shared surfaces (event cards, schedule, brackets) stable across Event Directory and OSS.

---

## Definition of Done

- All P0 tickets merged and QA-verified (or explicitly deferred with agreement).
- No critical or high-severity regressions on Event Directory, CMS, or OSS.
- Staging deployed with hardening changes; release cadence (code freeze → QA → staging → production) respected per OSS/Event Directory timelines.

---

## P0 — Must-haves (Highest priority)

*8 tickets. Complete before sprint close.*

| Key | Summary | Assignee | Status |
|-----|---------|----------|--------|
| SWA-170 | API Change from fb_compete.sports → public.sports | — | Backlog |
| SWA-169 | Create CMS Settings Page | — | Backlog |
| SWA-163 | Event Brackets on Schedule Sub-Page For Public Events Listing and OSS/CMS | — | Backlog |
| SWA-137 | Default Event img not in Event Details | — | Backlog |
| SWA-136 | [UI Bugs] Card height | — | Backlog |
| SWA-128 | [UI Bugs] Use Geist font here [P1] | — | Backlog |
| SWA-125 | [UI Bugs] Make the selected font white | — | Backlog |
| SWA-121 | [UI Bugs] Inconsistent Card spacing | — | Backlog |

---

## P1 — Nice-to-haves (Medium priority)

*14 tickets. Include as capacity allows.*

| Key | Summary | Assignee | Status |
|-----|---------|----------|--------|
| SWA-167 | Add "Fastbreak" Badge to Event Cards for Fastbreak Events | — | Backlog |
| SWA-166 | One-Time Import of External Events from Jarmal's List into Event Listings | — | Backlog |
| SWA-165 | One-Time Import of Compete Legacy Events into Event Listings | — | Backlog |
| SWA-164 | BallerTV Live Streaming — Banner & Live Game Links | — | Backlog |
| SWA-146 | Map Size | — | Backlog |
| SWA-135 | [UI Bugs] Layout? | — | Backlog |
| SWA-133 | [UI Bugs] Make this a carousel | — | Backlog |
| SWA-132 | [UI Bugs] Top align | — | Backlog |
| SWA-130 | [UI Bugs] MISSING schedule EMPTY STATE | — | Backlog |
| SWA-129 | [UI Bugs] MISSING DIVISION EMPTY STATE | — | Backlog |
| SWA-126 | [UI Bugs] Add a "x" in active state | — | Backlog |
| SWA-123 | [UI Bugs] UPDATE TO "RESULTS PER PAGE" | — | Backlog |
| SWA-122 | [UI Bugs] Search & date icons too small | — | Backlog |
| SWA-100 | Fastbreak Ticket / Travel CTAs | — | Backlog |

---

## P2 — Low priority

*10 tickets in scope; not listed. Defer unless P0/P1 are complete and capacity remains.*

---

## Priority mapping (reference)

| Jira Priority | Sprint tier |
|---------------|-------------|
| Highest | P0 (Must-have) |
| Medium | P1 (Nice-to-have) |
| Low / other | P2 (Low priority) |
