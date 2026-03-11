# Club Standard Site — Crawl

This is the MVP / crawl version of the [Club Standard Site](club-standard-site.md). Same pages and broad structure, but features within each page are stripped to the minimum needed to be useful. The goal is to get a club web presence live as fast as possible, then layer on richness in later phases.

## What's in vs. what's deferred

| Page / Area | Crawl | Deferred to later phases |
|-------------|-------|--------------------------|
| Home | Hero + featured programs + about | — |
| Programs listing | List with age group, program type, and registration status filters | Season filter, date range search, starting price on cards |
| Program detail | Info + dates + age groups + registration CTA | Capacity/availability, associated teams cross-link, schedule of events cross-link, pricing breakdown |
| Teams | Directory + team detail with rosters | Roster visibility configuration, coach bios, cross-links to schedule and programs |
| Schedule | Calendar/list view, filterable by team | Filters by program/sport/location, past event visibility, clickable drill-down to detail pages |
| Locations / facilities | List with map | Facility detail page, schedule filtering by location, photos/field details |
| Event history | Deferred entirely | Past seasons, results, standings |
| Admin panel | OSS baseline only (logo, color, name, about, socials, contact) | Team visibility toggles, roster visibility config |
| Footer | Same as OSS, adapted nav links | — |
| Responsive | All pages responsive, including calendar and roster tables | — |

## Site map (crawl)

```
Home
├── Hero
├── Featured / Upcoming Programs → See All → Programs Listing
└── About Us

Programs Listing
└── Program Detail
    └── Registration CTA → Club Platform

Teams
└── Team Detail
    └── Roster (names only, COPPA enforced for under-13)

Schedule
(calendar/list view, filterable by team)

Locations / Facilities
(list with map)

Admin Panel (authenticated, not public)
├── Settings (same as OSS)
└── Design (same as OSS)
```

Persistent across all pages: Navigation bar, Footer

## Requirements

### URL & access

- Site accessible at `{org-slug}.sites.fastbreak.ai`
- Publicly accessible without authentication
- Routing supports club orgs (`team_org`) in addition to event orgs (`event_org`)

### Navigation

- Persistent nav bar with org logo on all pages
- Responsive — collapses to mobile menu
- Nav items: Home, Programs, Teams, Schedule, Locations, About (anchor to home page section)

### Home page

- Hero banner with organization name. Black background. Org logo at top left.
- Featured / upcoming programs — list of active programs with name, dates, and registration status. "See All" links to Programs listing. Registration CTA on each card.
- Empty state when no active programs.
- About Us section with admin-configured text.

### Programs listing

- List of the club's programs scoped to the club org.
- Each card shows: program name, dates, age groups/divisions, program type, sport, and registration status.
- Filters: Age Group/Division, Program Type (season, camp, clinic, league, tournament), Registration Status. Filters hidden if only one option exists.
- Keyword search.
- Registration CTA on each card linking to Club Platform.
- Pagination.
- Empty state.

**Deferred:** season filter, date range search, starting price on cards.

### Program detail

- Program name, description, season dates, age groups/divisions, program type, registration status.
- Registration CTA linking to Club Platform.

**Deferred:** capacity and availability display, pricing/fee breakdown, associated teams cross-link, schedule of events cross-link.

### Teams

- Team directory browsable by division, age group, and season.
- Each listing shows: team name, division/age group, season, head coach name, roster count.
- Team detail page shows the team's roster (names only in crawl) and head coach.
- No athlete photos for players under 13 (COPPA).

**Deferred:** configurable roster visibility levels (names+numbers, names+numbers+positions), full coach/staff detail, cross-links to schedule and programs.

### Schedule

- Calendar and/or list view of upcoming events across the club.
- Filterable by team.
- Each entry shows: event name/type, date/time, teams involved, location.

**Deferred:** filters by program, sport, and location. Clickable entries linking to detail pages. Past event visibility.

### Locations / facilities

- List of club facilities with name and address.
- Interactive map with pins for each facility.

**Deferred:** facility detail page, schedule filtering by location, photos/field details/directions.

### Admin panel

- Same as OSS: logo, primary color, organization name, about us text, social media links, contact email/phone.
- Same onboarding flow and publish flow as OSS.

**Deferred:** team visibility toggles, roster visibility config, facility management in admin.

### Footer

- Same structure as OSS. Nav links adapted to club items (Home, Programs, Teams, Schedule, Locations, About).
- Platform links, social icons, "Powered by Fastbreak AI."

### Responsive design

- All pages responsive across desktop, tablet, mobile.
- Card grids, nav collapse, text readability — same baseline as OSS.
- Calendar/schedule view usable on mobile (list-view fallback if needed).
- Roster tables responsive — stacked card layout or horizontal scroll on mobile.

### Primary color usage

- Same as OSS baseline, extended to program cards and registration CTAs.

## API needs (crawl)

**Adapt or new build (investigation needed)**
- **Programs listing** — list programs by club org with age group, program type, and registration status filters. May be covered by adapting the Event List API, or may need a new endpoint.
- **Program detail** — program info with dates, age groups, program type. May be covered by adapting the Event By ID API, or may need a new endpoint.
- **Facilities / locations** — list of admin-configured facilities by club org. Current Venue By Event ID API is event-scoped — may be extendable to list by org, or may need a new endpoint.
- **Club schedule** — upcoming events across the club, filterable by team. Current Schedule API is event+division scoped — may need adaptation or a new endpoint.
- **List of Organizers** — needs to include club orgs if it doesn't already.

**New build**
- **Teams directory** — list teams by club org with division, age group, and season filters. Sourced from Club Platform.
- **Roster data** — player names on a team, COPPA enforced for under-13. Sourced from Club Platform.
- **Coach assignments** — head coach per team. Sourced from Club Platform.

**Not needed in crawl**
- Admin visibility toggles, roster visibility config, standings/event history.

## What crawl proves

- Club orgs can have a public site on the same infrastructure as OSS.
- Parents can discover a club's programs, browse teams and rosters, check the schedule, and find facilities.
- Registration flows from the site into Club Platform.
- The foundation is in place to layer on richer features (cross-linking, visibility controls, event history) in later phases.
