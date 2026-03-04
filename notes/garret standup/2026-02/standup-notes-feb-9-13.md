# Standup Notes - Feb 9-13

| Field | Value |
|-------|-------|
| Source | https://fastbreak.atlassian.net/wiki/spaces/ASPAD/pages/1000964097/Standup+Notes+-+Feb+9-13 |
| Format | confluence |
| Imported | 2025-03-03 |

---

## Sprint Work (2026-02-09)

### Standup 1

- Reviewing the original Swoop Event Directory PRD; there are SEO enhancements outlined by Tom that we are considering
- Today's plan - Building understanding of SEO enhancements, what would the lift be, does it shift timelines?
- Today's plan - Gathering any last information needed for the Event Listing API & how we will pull data from Compete's schema
- Today's plan - read over the past CMS PRD, maybe add a section to update the doc on what the existing data model and infra looks like

### Standup 2 w/ Ben B

**Event Listing**

- Event Listing endpoints - how are we securing this? Preventing someone from hitting the endpoints N amount of times
  - Could put a layer in front of the APIs that is cached
  - What does vercel specifically offer for a caching layer? CloudFront?
- Is IFraming the best idea? Need more details here.
  - Doesn't need to be a requirement for MVP
- How will we protect RSS?
- Can you use ISR for RSS feeds?
- Path requirements - need to think through this more
  - Most path's driven through the config file
  - Or maybe same paths point to the same places (i.e. /month/city/{operator})
- OIDC Federation
  - Easy way to protect Vercel to Vercel projects
  - Open ID Connect
- Ben will begin joining a standup once a week or so

**Operator Sites (Standard + CMS)**

- We're inheriting everything that was previously made
  - Ben doesn't care if we use any of the existing work or not
  - He would decouple standard site from CMS
    - But he's fine with it as long as we're super sure that we can test this thoroughly
    - Action Item: Take a couple of days to think about whether we'll have a display layer driven through a static definition of a website vs. current CMS which is just inputs — Just need to make a choice here, try a couple of iterations
- From the moment they click CMS in compete, the rest is us
  - Entitlements we can pull from API, basically definitions on what this user can do, what they paid for
  - Compete will handle taking the payment, subscribing to service, etc.
- Overall - back to the drawing board - what headless CMS is out there that we can utilize?
- What does vercel specifically offer for a caching layer? CloudFront?

**Messaging**

- What's the trigger that creates the groups?
- Need to define the application layer - how we want to determine who sees what, etc.
- Not too concerned with the extra security stuff - device tokens and auth tokens should be alright

**White Label Apps**

- Users don't really use these
  - Really this is a marketing tactic, our goal is to pull users to our own app
- But still think about stability, push notifications
- Driven through API, OTA for updates, maybe even a app that just wraps a browser
- How do we do this at scale?

**Convo about Vercel being Expensive**

- edge requests we get hit on a lot
- function duration is our biggest costs
- This ties into the conversation about an alternate caching layer

## Sprint Work (2026-02-10)

- Last minute prep items for Event Listing Sprint
  - Caching layer for Event Listing endpoints
  - Getting final sign off from Kyle on Event Listing API
- Kwajo working on V2 of CometChat PoC
  - Will share admin portal with other devs

## Sprint Work (2026-02-11)

### Jarmal

- All subproduct branding will be merged into [Fastbreak.ai](http://Fastbreak.ai).
- Rationale: customers were confused about what *Swoop* is; there was an education challenge.
- Event listing site is ~90% decided to become the new [Fastbreak.ai](http://Fastbreak.ai) homepage.
  - Alternative discussed: `events.fastbreak.ai`.
- (With Garret) Confirmed there will not be an admin dashboard.
- Will handle legacy event ingestion decision with Nick S. and update devs if it impacts them.
- Introduced PXI as the new naming convention for repos.

### Vinaya

- Updated existing designs to match Fastbreak colors.
- All current design updates are complete for now.
  - More changes may come depending on Eric's direction.
- Looking to meet with Eric for additional clarification.
- Exploring calendar view for saving events.
- Largely awaiting Tom's decision on ongoing brand changes.

### Ian

- Asked about supporting existing pages and updating the tab bar.
  - Decision: existing pages will not be supported in this iteration.
- Asked how to backlink to [Fastbreak.ai](http://Fastbreak.ai) (e.g., press logo).
  - Garret is anticipating a revised navigation header.
- Kicked back ticket for Featured Locations and left comments.
  - Garret prefers the algorithmic option as P1.
  - Ian to leave a plan on the ticket.
- Clarified scraped event data requirements:
  - Standings and schedules not required.
  - Basic event card data is required.
- APIs are ~90% done, targeting end of day or EOD tomorrow.
- Raised question about what to do with repo names. (swoop? pxi?)

### Garret

- Anticipating a revised navigation header.
- (With Jarmal) Confirmed no admin dashboard.
- Prefers algorithmic option for Featured Locations as P1.
- Team happy hour next week

### Kwajo

- Event card is wrapped up
- Proceeding with next set of shared components, will collab with Ian for handoff
- Planning to wrap remaining shared components over the next day or two.

### Jay

- Looking into Appium for mobile testing.
- Otherwise, looking and ready to take on additional testing.

### CEO John

- Interested in having a scraper.
- Wants lots of events in the system.
- Legacy Compete has ~417 events that could potentially be pulled in.

### Ben

- Checked in w/ Ian about RLS policy preference from Gavin. Confirmed we're going to adopt the public_cms role which should have all the policies that we need to proceed.

### Decisions / Open Questions

- **Legacy event ingestion:**
  - How to get legacy events into `public.events`?
  - Options: Export from AWS → Supabase.
  - Ben / Pedro are okay importing directly into prod.
  - Jarmal to coordinate with Nick S.

---

## 2026-02-12

**Vinaya** — Meeting with Tom and Eric later today about ongoing design changes. Question: Is OSS starting next week as listed on Ben B's document?

**Kwajo** — Took care of feedback on event tickets. Aiming to wrap shared components by Monday. Taking on a batch of 3 now. Planning to collab with Club next week to discuss messaging.

**Jay** — Getting set up with ticketing things. Working to learn mobile testing.

**Emily** — Moving on waivers and onboarding. Heads up: Discussions happening about having a calendar in the app so folks can see events they've signed up for.

**Ben** — Reviewed PRs from Ian and Kwajo. Merged in two of their own PRs, sent homepage out for review. Met w/ Joe + Kyle re: decision on OSS arch. Sent write up to team. Next step to get sign off from Ben.

---

## 2026-02-13

**Ian** — At a good spot for the API, aiming to wrap up by lunch. Will collab with Kwajo to pick up some components. Wrapped up Swagger documentation. Work/research needed to understand Compete's approach to building standings.

**Kwajo** — Working on search and filtering. Heads up — headed out a tad early today! Question from Garret about messaging timeline (mobile vs web) - answered that data is the same for both sides, UI needs to be built. Will discuss on Tuesday messaging call.

**Vinaya** — Came out of lots of talks yesterday, currently ideating changes to the homepage of the event listing site. These changes should be available and finalized by EOD or Tuesday EOD at the latest. Working on OSS page updates, aiming to wrap up by EOD Wednesday.

**Emily** — Getting confirmation from Ben for her items before passing along to K + V.

**Jay** — Moving forward with ticketing. Understanding the customer base and operator perspective.

**Garret** — Question about messaging timeline (should mobile and web be separate or parallel?). Plan: Concurrently working messaging AND OSS in the next spring. Note: Use Mapbox (from Ben B). Note: When we start scraping, scraped data will sit in a table alongside legacy data. Note: We can couple CMS and OSS.
