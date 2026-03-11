# Club Standard Site

## What we're building

A template-based public website for clubs — the club equivalent of the Operator Standard Site (OSS). Club admins get a branded, publicly accessible site at `{org-slug}.sites.fastbreak.ai` that showcases their programs, teams, schedules, and facilities, and drives visitors into Club Platform registration. Same templated model as OSS: clubs customize branding and content, not layout or structure.

## Site map

```
Home
├── Hero
├── Featured / Upcoming Programs → See All → Programs & Events Listing
└── About Us

Programs & Events Listing
└── Program / Event Detail
    ├── Registration CTA → Club Platform
    ├── Associated Teams → Teams & Rosters
    └── Schedule of Events → Schedule / Calendar

Teams & Rosters
└── Team Detail
    ├── Roster (visibility configurable by admin)
    ├── Coaches / Staff
    ├── Team Schedule → Schedule / Calendar
    └── Associated Program(s) → Program / Event Detail

Schedule / Calendar
└── Entry → Program / Event Detail or Team Detail

Locations / Facilities
└── Facility Detail
    └── Events at this location → Schedule / Calendar

Event History (past programs, seasons, events)

Admin Panel (authenticated, not public)
├── Settings (logo, color, org name, about, social, contact)
└── Design (site preview, "Request Pro Upgrade" for CMS features)
```

Persistent across all pages: Navigation bar, Footer

## Requirements

### URL & access

**From OSS**
- Site accessible at `{org-slug}.sites.fastbreak.ai`
- Publicly accessible without authentication
- Slug is unique per club org and URL-safe (lowercase, hyphens only)
- Custom domain mapping out of scope for the standard tier

**New**
- Routing must support club orgs (`team_org`) in addition to event orgs (`event_org`). The current OSS routing resolves operator orgs only — club standard sites require the same slug-based resolution for club organizations.

### Navigation

**From OSS**
- Persistent navigation bar on all pages with org logo
- Responsive — collapses to mobile-friendly menu on smaller viewports

**New**
- Nav items adapted for clubs. OSS has: Home, Events, About, Locations. Club nav items TBD but expected to include some combination of: Home, Programs, Teams, Schedule, Facilities/Locations. About likely becomes an anchor link on the home page (same as OSS).
- Nav item set may differ from OSS — needs design input on which items are top-level nav vs. home page sections vs. sub-pages.

### Home page

**From OSS**
- Hero banner featuring the organization name. Black background (future: photo). Org logo at top left. Responsive.
- About Us section with admin-configured text and anchor ID for nav linking.

**New**
- Featured / upcoming programs section — active programs (seasons, camps, clinics, leagues) with key details (name, dates, age groups, registration status) and registration CTAs. Replaces OSS "Upcoming Events" grid. Number of cards, pagination, and filter options TBD. "See All" link navigates to the full Programs & events listing page.
- Empty state when the club has no active programs.
- Tournament locations section from OSS does **not** carry over to the home page. Schedule, teams, and facilities live on their own pages — the home page stays lean like OSS (hero, programs, about).

### Programs & events listing

**From OSS**
- Full listing page with search and filter capabilities, same pattern as OSS Events page.
- Responsive grid with pagination.
- "Clear All" to reset filters.
- Empty state when no programs/events are available.

**New**
- Scoped to the club's programs and events (OSS scopes to the operator's events).
- Lists **programs** (seasons, camps, clinics, leagues) in addition to individual events (games, tournaments). OSS only lists tournament events.
- Each program card displays: program name, season/dates, age groups/divisions, sport, registration status (open/closed/waitlist), and starting price.
- Filter categories adapted for clubs: Sport, Age Group/Division, Program Type (season, camp, clinic, league, tournament), Registration Status, Season. Filters with only one option across the club's data should be hidden dynamically (same logic as OSS).
- Search by keyword and date range.
- Registration CTA on each card linking to Club Platform registration.
- **API:** Existing event listing APIs need re-scoping to support club orgs. If the event API already references programs/seasons, this may be an adaptation of the existing API rather than a net-new build. Needs investigation — if programs/seasons are not in the current API, new endpoints are required from Club Platform.

### Program / event detail

**From OSS**
- Clicking a card from listings or home page navigates to a detail page.
- Page lives under the org's site URL (does not redirect elsewhere).

**New**
- Registration CTA hands off to Club Platform registration (OSS hands off to Compete).
- Program detail includes: program name, description, season dates, age groups/divisions, capacity and availability, pricing/fee structure, registration status, and associated teams.
- Event detail (game, tournament, etc.) includes: event name, date/time, location, teams/opponents, and any results if the event has completed.
- Programs may link to their associated teams (cross-link to Teams & rosters).
- Programs may show their schedule of events (cross-link to Schedule / calendar).
- **API:** Existing event detail APIs need re-scoping for club orgs. If the event detail API already references program data (description, capacity, fees, associated teams), this may be an adaptation rather than a net-new build. Needs investigation — if program detail data is not in the current API, new endpoints are required from Club Platform.

### Teams & rosters

**New**
- Public team directory browsable by division, age group, and season.
- Each team listing shows: team name, division/age group, season, head coach name, and roster count.
- Team detail page shows the team's roster, schedule, and associated program(s).
- Roster visibility is configurable by the club admin — admin controls whether rosters are public, and what fields are shown (name only, name + number, name + number + position).
- No athlete photos displayed for players under 13 (COPPA).
- Coaches and staff assigned to the team are displayed.
- Team detail links to the team's upcoming schedule (cross-link to Schedule / calendar).
- **API: New APIs needed** — teams directory, roster data with visibility controls, coach/staff assignments. All sourced from Club Platform.

### Schedule / calendar

**New**
- Public calendar view of upcoming games, practices, and events across the club.
- Filterable by team, program, sport, and location.
- Calendar and/or list view — format TBD with design.
- Each schedule entry shows: event type, date/time, teams involved, location, and opponent (if applicable).
- Clicking an entry navigates to the event detail or team detail page.
- Past events remain visible (not hidden once completed) — feeds into event history.
- **API: New APIs needed** — club-wide schedule/calendar data with filtering support. Sourced from Club Platform scheduling & calendar feature.

### Locations / facilities

**From OSS**
- Interactive map showing locations.
- List of locations alongside the map.

**New**
- Data is scoped to the club's facilities (OSS scopes to the operator's event locations).
- Facility data is **admin-configured**, not auto-derived from event data. OSS tournament locations are auto-populated from event location data — club facilities are explicitly managed by the admin.
- Each facility listing shows: facility name, address, and map pin. Future: photos, field/court details, directions.
- Clicking a facility may filter the schedule to events at that location.
- Whether this is a dedicated page, a home page section, or both is TBD.
- **API:** If the existing venues API can be adapted to support club facilities, this may be an edit to the current API rather than a net-new build. Needs investigation — if not, new CRUD and listing endpoints are required, sourced from Club Platform or a new lightweight facility management layer.

### Event history

**New**
- Past programs, seasons, and/or events displayed publicly.
- Gives the club a track record — shows prospective families that the club is established and active.
- Scope TBD: could range from a simple "past seasons" list to richer content with results, standings, or season recaps.
- May live as a filter state on the programs/events listing (e.g., "Past" tab) or as a dedicated section.
- **API: Same program/event listing APIs** with date-range filtering to return completed items.

### Admin panel

**From OSS**
- Admin panel for configuring site branding and content.
- Configurable fields: logo, primary color (preset choices + custom with ADA liability language), organization name, about us text, social media links, contact email and phone (optional).
- Onboarding flow presents a form with all fields, Save button, and validation feedback. Same pattern as CMS onboarding.
- Publish flow: CMS editor shell consistent with Compete v2 nav. Design and Settings tabs. CMS customizable sections greyed out with "Request Pro Upgrade" CTA linking to support email.

**New**
- Toggle which teams are publicly visible on the site.
- Configure roster visibility level (hidden / names only / names + numbers / names + numbers + positions).
- **Expansion options (future):** staff/coach bios and photos, program descriptions and media, custom content blocks.
- **API: New admin APIs needed** for visibility toggles and facility management. May extend existing CMS admin APIs or require new endpoints.

### Footer

**From OSS**
- Footer on all pages with: organization name, navigation links, platform links (Terms of Use, Privacy Policy, Referral Program, Become a Sponsor), social media icons, "Powered by Fastbreak AI" branding.
- Platform links go to Fastbreak pages, not club-configured URLs.
- "Powered by Fastbreak AI" is non-removable in the standard tier.

**New**
- Navigation links in the footer match the club nav items (Programs, Teams, Schedule, etc.) instead of OSS nav items (Events, About, Locations).

### Responsive design

**From OSS**
- All pages and components fully responsive across desktop, tablet, and mobile.
- Card grids adapt column count by viewport.
- Navigation collapses to hamburger/mobile menu.
- Filter panels adapt for mobile (collapsible or modal).
- Map and locations usable on touch devices.
- All text readable without horizontal scrolling.

**New**
- Calendar/schedule view must be usable on mobile — calendar views are notoriously difficult on small screens. May require a list-view fallback on mobile.
- Team roster tables must be responsive — horizontal scrolling or stacked card layout on mobile.

### Primary color usage

**From OSS**
- Primary color applied to: "See All" / CTA buttons, header selected state, contact icons, mobile UI accents.

**New**
- Primary color extends to new components: program cards, team directory, schedule entries, facility map pins, registration CTAs.

## Tech / constraints

### Current APIs (OSS / Compete)

These are the existing event-centric APIs. All are scoped to events or event orgs today.

| API | Current scope |
|-----|---------------|
| Event List | List events, scoped to event orgs |
| Event By ID | Single event detail |
| Venue By Event ID | Venues for a specific event |
| Division By Event ID | Divisions for a specific event |
| Schedule By Event ID and Division | Schedule for a specific event + division |
| Standings By Event and Division | Standings for a specific event + division |
| List of Organizers | List of event organizers |

### API needs for Club Standard Site

**New build** — no existing API covers these. Sourced from Club Platform.

- **Teams directory** — list teams by club org with filters (division, age group, season).
- **Roster data** — players on a team with visibility controls (respecting admin configuration and COPPA for under-13).
- **Coach/staff assignments** — staff assigned to a team.
- **Admin visibility toggles** — APIs for setting public/private status on teams.
- **Roster visibility config** — API for setting the roster display level per club.

**Adapt or new build** — existing APIs may cover these with adaptation, or new endpoints may be needed. Engineering investigation required.

- **Programs / seasons listing** — list programs by club org with filters (sport, age group, program type, registration status, date range). May be covered by adapting the Event List API if it already references programs/seasons, or may require a new endpoint from Club Platform.
- **Program detail** — program description, dates, capacity, pricing, registration status, associated teams. May be covered by adapting the Event By ID API if it already includes program data, or may require a new endpoint from Club Platform.
- **Club-wide schedule / calendar** — events across the entire club filterable by team, program, and location. Current Schedule By Event ID and Division API is scoped to a single event + division — club schedule is significantly broader. May require adaptation or a new endpoint.
- **Facilities / locations** — standalone listing and management for admin-configured club facilities, not scoped to a single event. Current Venue By Event ID API is event-scoped. May be extendable to list venues by org, or may require a new endpoint.
- **Standings / event history** — past results by event and division. Current Standings By Event and Division API may be sufficient for detail views, but a club-wide aggregation would be new.
- **List of Organizers** — needs to include club orgs (`team_org`) if it doesn't already.

### Other constraints
- **COPPA** — no athlete photos for players under 13. Roster display for minors must respect parental consent and privacy settings.
- **Club Platform dependency** — the Club Platform is under active development. API availability will gate which features can ship. This PRD should be sequenced against Club Platform milestones.
- **Shared site infrastructure** — club standard sites should run on the same infrastructure as OSS (same CMS engine, same hosting, same URL scheme). The goal is extending the existing system, not building a parallel one.

## Blocking decisions

These must be resolved before work can be scoped or scheduled.

- [ ] **Shared Standard Site engine vs. club-specific implementation.** Should CSS be built as a configuration of a shared Standard Site engine (where org type determines available pages and data sources), or as a club-specific fork/implementation alongside OSS? This decision shapes everything downstream.
  - **Shared engine:** OSS gets refactored so that org type (`event_org` vs. `team_org`) drives which pages, nav items, and data sources are active. Club sites become a configuration, not a separate codebase. Future org types (leagues, academies, etc.) plug in without new implementations. Upfront cost is higher — requires refactoring OSS first — but long-term maintenance is lower and extensibility is built in.
  - **Club-specific implementation:** CSS is built as its own implementation, reusing OSS components where possible but maintained separately. Faster to ship initially — no need to refactor OSS. But creates two codebases that will drift apart over time. Every shared change (footer updates, theming, responsive fixes, publish flow changes) needs to be applied in two places. Adding a third org type later means a third implementation.
  - **Recommendation from CTO review:** resolve this before writing code. If the answer is shared engine, the first piece of work is refactoring OSS to be org-type-configurable. If the answer is fork, acknowledge the ongoing maintenance cost.
- [ ] **Club Platform API timeline** — which APIs are available now, planned, or not yet scoped? Determines what can ship and when.
- [ ] **Should club sites support Compete events in addition to Club Platform programs?** Clubs may also run tournaments through Compete. Affects data sources, API scope, and listing/detail page design.
- [ ] **Ship-by date TBD.**

## Open questions

These can be resolved during design/development without blocking the timeline.

- [ ] Nav items: which items are top-level nav vs. home page sections vs. sub-pages? Needs design input.
- [ ] Home page layout: sections are hero, featured/upcoming programs, and about. Ordering and design TBD.
- [ ] Facilities: dedicated page, home page section, or both?
- [ ] Event history: simple past-seasons list or richer content (results, standings, recaps)?
- [ ] Schedule view: calendar view, list view, or both? What's the default?
- [ ] Roster visibility defaults: what's the default visibility level for a new club site?
- [ ] Program card design: what fields appear on the card vs. only on the detail page?
