# Standup Notes - Feb 2-6

| Field | Value |
|-------|-------|
| Source | https://fastbreak.atlassian.net/wiki/spaces/ASPAD/pages/973340708/Standup+Notes+-+Feb+2-6 |
| Format | confluence |
| Imported | 2025-03-03 |

---

## Sprint Work (2026-02-02)

- Swoop API and Swoop API Router PRs incoming, to be reviewed
- Should hopefully be done testing in dev by end of day today
- Two android bugs - will look into them
- Prep work to get into the Google Play store
  - Marketing Assets, etc.
  - Will review and see what we need
- Want to start releasing end of day Thursday
- Devs will prioritize getting a build of the app to Jay to begin testing

## Sprint Work (2026-02-03)

- Got Android Play Store set up, was working through build and RLS issues yesterday. Today will be continuing to test the Checkout RLS issue after Ben B's change, as well as addressing other bugs that arise. There's an RLS issue with writing to public.users that needs to be addressed (infinite recursion error).
- Working on bugs identified by Jay, also looking into event listing repo
- Working on a Swagger for the event listing API. Will be working through bugs with the devs. Mobile PoC still in flight. Creating tickets for Event Listing Sprint

## Sprint Work (2026-02-04)

- Will start testing android this morning. Was blocked yesterday do to changes to the fb_compete_user role that's preventing mobile users from seeing events.
- Need to create a new RLS role specifically for us, since fb_compete_user is now specific to compete. Will then continue building out tickets for next sprint.
- Worked on public.users work, Gavin was able to resolve the recursive RLS policy issue. Payment issue still unresolved, but we've decided to no longer focus on this. Got a new android build out to fix OAuth. Focused on R5 items today.
- Two PRS ready for review. Will also look into R5 items today.
- Will be doing a design sync with the devs today, finalizing screens for event listing

## Sprint Work (2026-02-05)

- Working on R5 items - API design document, publishing new Android changes, scheduled design sync
- Reviewed bugs with Jay, tackling the items that are high priority. Looking at DB Compete schema in preparation for R5
- Finishing up CometChat PoC, as a followup to last weeks feedback session with Ben
- Made bug tickets for app, collaborating with devs to determine which items are high priority and should be completed today
- Working on some of the updates for the event listing site - preparing for design sync. Met with Compete to compare designs for event cards, other event listing related components

## Sprint Work (2026-02-06)

- Working on getting a local DB together with Gavin, so that we can test against Compete Schema. Working on R5 prep, specifically Compete's DB Schema and what we need to pull from
- Got event listing site up and running, created a new repo in prep for this next sprint
- Addressed feedback from Design Review, cleaning up Event Listing site
- Mobile CometChat PoC done, jumping back into the remaining R5 planning
- Finished making bug tickets in dev
