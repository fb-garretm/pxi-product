# Platform Architecture Sprint PRD

| Field | Value |
|-------|-------|
| Source | Pasted by user |
| Format | pasted |
| Imported | 2025-03-03 |

---

# Product Requirements Document — Swoop Platform + Architecture Sprint

**API-First Architecture, Universal Login, and Security Enhancements**

| Field | Value |
|-------|-------|
| Version | 1.0 |
| Date | January 13, 2026 |
| Status | Draft |
| Release Date | February 11, 2026 |
| Sprint Type | Platform + Architecture |

**Product Team:** PM: Garret Mann · Dev Lead: Kwajo Boateng · Design: Vinaya Naikar

**Figma:** [Universal Login Flow](https://www.figma.com)

---

## Executive Summary

This sprint establishes foundational platform improvements to unify Swoop with other Fastbreak products through API-first architecture, Universal Login implementation, and enhanced security via Row Level Security (RLS) roles. These changes transition Swoop from direct database access patterns to a modern, maintainable architecture that aligns with company-wide standards.

## Sprint Goal

Unify with other Fastbreak products and introduce stability by making Swoop API-first, introducing new RLS roles, and implementing Universal Login by Feb 11, 2026.

## Success Criteria

- All applications (swoop-app, swoop-web) and 3rd party applications (e.g. Google Maps) consume APIs exclusively (no direct DB access)
- Universal Login functional on Swoop
- RLS roles defined, approved, and implemented
- Platform hygiene tasks completed (unused tables removed, dead code cleaned)

---

## 1. Requirements: Security Enhancements

**Objective:** Implement comprehensive Row Level Security (RLS) roles and policies to ensure proper data access controls across all Swoop products.

### 1.1 Define Swoop RLS Roles

**Requirements:**

- New Swoop RLS roles are defined and documented
- Roles are reviewed and approved by Ben B
- Role definitions are implemented in Supabase

**Technical Notes:** Collaborate with Gavin on role definitions and implementation. Align with other Fastbreak products role patterns.

### 1.2 Reformat RLS Policies Based on New Roles

**Requirements:**

- New RLS policies are created for all new roles
- Old/irrelevant policies are removed
- Policies are implemented in our repositories
- Each user role has correct access permissions in both applications
- No unauthorized data access is possible

**Dependencies:** Story 1.1 (Define RLS Roles) must be completed first.

**Technical Notes:** Test each role access permissions thoroughly. Document policy changes for future reference.

---

## 2. Requirements: Auth and Identity

**Objective:** Implement Universal Login across all Swoop products to standardize authentication with other Fastbreak products and improve user experience. Needs to be approved by Ben B, especially as it relates to other Fastbreak products.

### 2.1 Universal Login — Database Changes

**Requirements:**

- User phone numbers are tied to club user records
- Swoop users are populated into `public.users` table
- All UUID-based user associations are removed
- Database schema supports Universal Login patterns
- FB-toolkit utilized to standardize the way we handle Supabase tokens
- Needs to be approved by Ben B, especially as it relates to other Fastbreak products

**Technical Notes:** Coordinate with other Fastbreak products user schema. Ensure data integrity during user record migration.

### 2.2 Universal Login — Swoop-web Implementation

**Requirements:**

- Universal Login auth patterns are implemented in swoop-web
- UI changes are implemented per design specifications (@Vinaya Naikar to attach)
- Users can successfully authenticate using Universal Login
- Existing user sessions are handled gracefully
- Needs to be approved by Ben B, especially as it relates to other Fastbreak products

**Dependencies:** Story 2.1 (Database Changes) must be completed first. Design specifications from @Vinaya Naikar.

### 2.3 Universal Login — Swoop-app Implementation

**Requirements:**

- Universal Login auth patterns are implemented in swoop-app
- UI changes are implemented per design specifications (@Vinaya Naikar to attach)
- Users can successfully authenticate using Universal Login
- Existing user sessions are handled gracefully
- Needs to be approved by Ben B, especially as it relates to other Fastbreak products

**Dependencies:** Story 2.1 (Database Changes) must be completed first. Design specifications from @Vinaya Naikar.

---

## 3. Requirements: Org and Data Model

**Objective:** Standardize organization handling to align with other Fastbreak products by migrating from custom tables to shared organization schema.

### 3.1 Normalize Organization Handling in DB

**Requirements:**

- Organization data is migrated from `fb.connect_organizer` to `public.organizations`
- Org Type ID is introduced as a foreign key in Swoop schema
- Appropriate `public.organization_types` are identified and implemented
- All existing organization references are updated to use new schema
- Data migration is complete with no data loss

**Technical Notes:** Currently using `fb.connect_organizer` table. Need to determine which organization_types apply to Swoop organizations.

---

## 4. Requirements: Platform and Architecture

**Objective:** Establish API-first architecture by creating a dedicated API repository and implementing a mobile API router for version management.

### 4.1 Create New API-Only Repository

**Requirements:**

- New API repository is created and configured
- All API logic from swoop-web is migrated to new repository
- All API endpoints are tested locally and functioning as expected
- Repository follows company coding standards and patterns

**Technical Notes:** Do not remove APIs from swoop-web. Coordinate with separate tickets for swoop-app and swoop-web consumption changes.

### 4.2 Swoop-app API Changes

**Requirements:**

- All direct database access is removed from swoop-app
- Swoop-app successfully consumes APIs from new API repository (via the API router)
- All existing functionality works without regression
- No direct database queries remain in swoop-app codebase

**Technical Notes:** Migrate existing direct DB logic to new API repository.

### 4.3 Swoop-web API Changes

**Requirements:**

- Swoop-web successfully consumes APIs from new API repository
- Swoop-web functions normally with no new API-related issues
- No regression in existing features

### 4.4 Create/Implement Mobile API Router

**Requirements:**

- New router repository is created
- Router can serve different API environments to app users
- Swoop-app is configured to point to the router
- Router is configured to point to new API repository

**Technical Notes:** Reference EET Mobile API router implementation. Collaborate with Satyam on router logic and patterns. Router logic should mirror EET's approach. Integration points: swoop-app → router → new API repo.

---

## 5. Requirements: Platform Hygiene

**Objective:** Clean up technical debt to improve maintainability and reduce confusion in the codebase.

### 5.1 Cleanup Unused DB Tables

**Requirements:**

- All unreferenced database tables are identified and removed
- Table schemas are documented in Confluence under Deprecated Table Schemas for future reference
- Tables currently in use are preserved for future consolidation review

**Technical Notes:** Review all repositories to identify table references. Do not remove tables that are actively referenced. Future sprint will handle consolidation of in-use tables.

### 5.2 Remove Dead Code

**Requirements:**

- All unreferenced code is removed from swoop-app, swoop-web, and related repositories
- Code removal does not impact existing functionality

---

## 6. Technical Dependencies

**Internal Dependencies:**

- Universal Login design specifications (@Vinaya Naikar)
- Universal Login database and/or experience changes (@Ben B)
- EET Mobile API Router reference (collaborate with Satyam)
- RLS role approval (Ben B)
- RLS implementation support (Gavin)

**Sequential Dependencies:** The completion of Requirement 1 (Security), which is scheduled for the end of January, is a prerequisite for Requirement 2 (Auth and Identity), specifically the Universal Login changes. This timeline is intended to provide developers with sufficient time to complete Requirement 2 without complications.

---

## 7. Risk Assessment

RLS policies must be implemented by the end of January, in preparation for the organization-wide enforcement of these new policies.

---

## 8. Sprint Timeline

**Sprint Structure:**

- Code Freeze: Jan 30, 2026
- QA Dev Begins: Feb 2, 2026
- QA Staging: Feb 9, 2026
- QA Prod verification: Feb 10, 2026
- Apple Submission: Feb 10, 2026
- Target Release Date: February 11, 2026

**Key Milestones:** Spend first 2 days of development time to self-groom; make sure all questions around scope are answered and do discovery.
