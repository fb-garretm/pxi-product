# Standup Notes - Feb 23-27

| Field | Value |
|-------|-------|
| Source | https://fastbreak.atlassian.net/wiki/spaces/ASPAD/pages/1043070977/Standup+Notes+-+Feb+23-27 |
| Format | confluence |
| Imported | 2025-03-03 |

---

## 2026-02-23

**Ian**

1. Clear to skip the bracket page
2. Meeting with Kyle today
3. Got clearance from Joe to skip that functionality / make it a P1

**Kwajo**

1. Working on design nits
2. Ben (me) to get back to him

**Vinaya**

1. Working on mobile app things: messaging, homepage, navigation

**Ben**

1. To get back to Kwajo with things to do

**Team update**

1. Update cities to Chicago, Dallas, Kansas City, Detroit

---

## 2026-02-24

**Jay** — Sent out document for test cases for dev testing flows. Devs to go in and assign themselves. Kwajo to add IDs for QA test automation.

**Kwajo** — Nothing major to report. To add IDs for QA test automation. Bring questions over to the CometChat people. Working with QA.

**Ian** — Division testing. Working with QA.

**Garret** — Plan: Split up the team - Ben moving to OSS now to get a head start, Kwajo + Ian to work with QA.

**Vinaya** — Wrapping CMS designs. Clean up on some of the designs, missing screens.

**Ben** — Nothing major to report. Code freeze items. Moving to OSS now to get a head start (per Garret's plan).

**Emily** — Waiting on us to get back about messaging.

**Team update** — Code Freeze! Good job everyone!

---

## 2026-02-25

**Ian** — Need to make the changes for the website for divisions / schedule tabs. Looking to wrap up by EOD.

**Jay** — Continuing testing; made some progress yesterday but interrupted by meetings. Gave all clear to promote to prod.

**Kwajo** — Knock out bugs as they come up. Filtering by organizers. Gave all clear to promote to prod.

**Vinaya** — CMS designs are done! Jumping on to mobile designs now.

**Garret** — Horizontal card feasibility for event search.

**Emily** — Team formation user management.

---

## 2026-02-26

**Special opening from Garret:**

- PXI pillars! High level goals, what we aim to achieve, how we win.
  - Operator presence
  - Club enablement
  - Partner performance
  - Participant value

**Jay** — Made a bunch of tickets; making more today. Focusing on the organizer side.

**Ian** — Made API changes + merged in. Will proceed with testing on standings + division.

**Kwajo** — High priority bug tickets:
  - Search won't work if folks don't choose a location from the pre-populated list
  - Search on enter press (up for grabs!)
  - IP API – prepopulate location defaults
- Getting CMS running locally.

**Ben** — (no items)

**Vinaya** — OSS is ready for dev. Responded to all the comments.
  - Note: event cards on results have changed
  - Note: New BallerTV integration

---

## 2026-02-27

**Jay** — All tickets that are being worked on, we will push everything up to dev. Ideally, by EOD, we can push to staging. Today by EOD we are aiming to be in staging. EOD Monday staging testing should be wrapped.

**Ian** — Two tickets from yesterday; aiming to polish and get into PR today.

**Kwajo** — Couple things in flight. IP-API integration in flight (SWA-119). Search result count is off; client side status.

**Garret** — Discussion around *(note appears to be incomplete)*

**Ben** — Updates from the amateur sports sync (see below). Today, continuing on CMS. Yesterday got CMS dev working with help from Kyle.

**Vinaya** — Presented requested changes / nits on the current state of the design.

**Updates from sports sync:**

1. We are building out a new fee and platform pricing framework
   - Hannah and Kevin leading this
   - Commission, platform fees, etc.
2. Mobile and web navigation
3. Toolkit v3 — new this weekend. Will include Stagis for feature flagging.
   - Will have examples
4. Sport and Player Position will be public (table) schemas NOT enums.
