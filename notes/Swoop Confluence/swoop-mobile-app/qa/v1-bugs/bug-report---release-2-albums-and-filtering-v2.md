# (Bug Report) - Release 2 Albums and Filtering (V2)

| Field | Value |
|-------|-------|
| Source | https://fastbreak.atlassian.net/wiki/spaces/ASPAD/pages/824016910 |
| Format | confluence |
| Imported | 2025-03-03 |

---

# Bug Report

- The app is mostly *functioning*, but edge cases, performance issues, and data correctness bugs are stacking up

- 
Incorrect data displayed
- Confusing UX
- Broken expectations
- Silent failures

| Status | Count | Meaning |
|---|---|---|
| **Ready for Dev** | **25** | Fully validated, actionable bugs |
| **Backlog** | 15 | Likely real, but not yet validated or prioritized |
| **Done** | 7 | Fix velocity is decent |
| **Ready for Code / Functional Review** | 1 | Mid-pipeline |

### Priority Breakdown

- **Medium:** 46
- **High:** 1
- **Highest:** 1
### Ownership & Load

- **Ian Knapp:** 38 of 48 bugs
- **Unassigned:** **7**
- **Abraham Reyes:** **2**
- **Pedro de La Cruz Cornieles:** **1**
-  Entering Chat
### Bug Theme

### 1. Filtering, Search & Sorting (HIGH RISK)

Examples:

- Event filters return incorrect results
- AI search results appear in inconsistent order
- Photo counts show zero incorrectly
- Filters behave differently between views
### 2. Media Integrity & Download Issues (HIGH RISK)

Examples:

- Transformed image downloaded instead of original
- Wrong file versions returned
- Album display inconsistencies
### 3. Workflow & State Issues (MEDIUM–HIGH)

Examples:

- Album creation without required metadata
- Event creation flows allowing partial/inconsistent states
- Admin settings not clearing correctly
### 4. Performance & Stability (MEDIUM)

Examples:

- Session times out too frequently
- Portal dev sessions expiring after 2–3 min
- Media indexing limits causing failures
### 5. UX / Display Consistency (LOW–MEDIUM)

Examples:

- Missing counts
- Albums not rendering as expected
- Layout mismatches after filtering
