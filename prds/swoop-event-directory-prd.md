# Swoop Event Directory PRD


| Field    | Value          |
| -------- | -------------- |
| Source   | Pasted by user |
| Format   | pasted         |
| Imported | 2025-03-03     |


---

# Product Requirements Document — Event Listing & Discovery Platform


| Field              | Value            |
| ------------------ | ---------------- |
| Development Status | In Progress      |
| Date Last Updated  | January 13, 2026 |
| PRD Status         | Draft            |
| Release Date       | March 3, 2026    |
| Sprint Type        | Feature Release  |


**Product Team:** PM: Garret Mann · Dev Lead: Ben Lapidus · Design: Vinaya Naikar

**Figma:** [Event Listing Web](https://www.figma.com) · [Event Listing Mobile App](https://www.figma.com)

---

## 1. Objective

Create a high-performance, public-facing website and a flow within the Swoop Website for listing sports events. The site and app flow will showcase both Compete (Phase 1 = Only Compete V2) and independent events (Phase 2 which may also include legacy Compete), offering robust search and filtering capabilities for users. It will operate on its own set of database tables, with administrative controls to manage which events are published.

**Sprint goal:** If I'm coming to register for a Compete event, I can find and complete registration. If I'm already registered for a Compete event, I can see the metadata for that event. This functionality will be released on web and mobile web March 2, 2026.

**Sprint Timeline:**

- Sprint Planning / Ticket Grooming: Feb 4
- Scoping and Planning: Feb 4 - 9
- Self-grooming / discovery / research / design + dev clarifications: Feb 10 - 11
- Development: Feb 12 - 23
- Code Freeze: Feb 23
- QA Dev Begins: Feb 23
- Staging Release: Feb 27
- Apple/Google Store Submission: Feb 27
- Production Release: Mar 3

---

## 2. Functional Requirements

### 2.1 Search & Discovery

- The system shall provide event search by name, organizer, sport, location, dates
- The system shall provide geographic search with radius-based filtering
- The system shall support filtering by event type (single-day events, multi-day events) (P1)
- The system shall support filtering by date and date ranges
- The system shall support filtering by sport
- The system shall support filtering by organization
- The system shall support filtering by age range and skill level
- On click to the search bar, the system shall show suggested events and locations based on the user's location and proximity
- On entry to the home page, the user should get prompted to share location
- The Home page should show a shelf with event organizers' logos which are clickable to filter by event organizer. This list will be sorted by # of events descending and only include organizers with a logo
- The 'see more' button will bring the user to an organizer-only page below which will be alphabetical by default but have a 'sort by' dropdown to change the sort to '# of events descending'
- The system shall allow filtering based on bookmarked events (events the user bookmarks themselves) (P1)

### 2.2 Event Display

- The system shall display value props about the event under the title: **# guaranteed matches** (if available), and what types of divisions are included
- The system shall display event name, event/organizers logo, event cover photo, event sport, lowest price for event, event date(s), event location and divisions (truncated to 2 lines). *Note: Divisions isn't a field yet; Compete will add one for launch of v2*
- On entry to the home page, the user should get prompted to share location
- All events will be sorted — location first and then date (based on IP)
- If there are no events in their location up to 500 miles, show events chronologically (date first then location)

**Sections on the event display page:**

- **EVENT ORGANIZERS** — List of all event organizers from Compete. Populate based on number of available events — organizers with a logo and most number of events show first
- **REGISTER FOR EVENTS** — List of events that are open for registration only. Show events in chronological order
- **THIS WEEKEND** — Events happening over the upcoming weekend. This category can have overlapping events with Register for Events. Show events in chronological order
- **UPCOMING EVENTS** — All other events that do not fall in the above 2 categories. For this release, show all other remaining events here. Show only 3 rows of Upcoming Events on the homepage in chronological order; all other events hidden under the "See more" button. Don't overlap events from This Weekend but can show events from Register for Events. Show events in chronological order
- **PAST EVENTS** — All past events (e.g. for checking scores). Most recently completed event first
- There should show 4 "trending cities" near the bottom of the page for users to select to filter the location — cities with the most events or cities with featured events if we have them (P1)
- There should be 4 unlisted routes available that follow SEO best practices (4 for basketball, cities specified in the ticket)

**Reference implementations:**

- [https://events.fastbreakcompete.ai/events?view=grid](https://events.fastbreakcompete.ai/events?view=grid)
- [https://www.playeasy.com/events/marketplace](https://www.playeasy.com/events/marketplace)

---

## 3. Internal Events Requirements

### 3.1 Dynamic Content Display Requirements

- Internal events shall display dynamic information based on `event_type` (array of products)
- Subpages shall be displayed dynamically based on available products (Compete, EET, Travel)
- Throughout all tabs there will be a banner with the event name, logo, price, organizer name, and register button. The banner will shrink on scroll and will be a sticky banner at the top of the page. Below the event details banner, there will be a tab-like menu which will also be sticky at the top of the page, below the event details banner
- All pages should have breadcrumbs back to the homepage, at the top of the page for SEO consistency

#### Registration Tab

- When an event includes the Compete product, the system shall display a Registration link to the registration page on Compete
- The registration page shall display event overview/description when available. Overview includes location, dates, divisions, cost
- System shall display a dynamic registration open and close (one or the other depending if registration is currently open or closed)
- System shall display the ability to share events and bookmark events on this page
- System shall display phone number, email, and name of organizer
- About Event will have a 1000 character limit and then will be a 'see more'

#### Schedule Tab

- When an event includes the Compete product, the system shall display schedule and brackets
- Users can search for team or division (schedule group). Divisions will not be separated by boys/girls and will be sorted using logic from Compete
- Selecting a division (schedule group) (e.g., boys 14U) will take the user to a detailed page for that division (schedule group), which includes standings, results, the full schedule, and brackets
- Standings will show only top 7 with the ability to expand. Standings will include Wins, losses, points for, points allowed, point differential
- Users can search for team (with dropdown and real-time filtering in dropdown) which will filter the schedule to only show that team
- Score cards in the schedule/results will have a link to get directions to the game, time of game, venue name, court (if applicable), and a symbol if the game is live
- Bracket will be an option to see (via a dropdown) instead of a schedule. For 3/3 there will be no brackets but anything that would need a bracket will be displayed as a regular schedule. We will attempt to get brackets in before v2 launch

#### Venues Tab

- Using the Google Maps API. When an event includes the Compete product, the system shall display venues in a gridded list
- Details provided: venue's name, a description, the address, and a map that includes a direct "view map" link. If multiple venues, will stack

#### Divisions Tab

- Display the division name included in the event
- Display the price for registration in that division
- Display the total capacity for that division if applicable
- Display if that price is early bird
- Search bar for divisions

#### Footer

The Swoop.ai footer must be designed to serve as both a navigation anchor and a trust signal.

- **Logo:** Swoop Fueled by Fastbreak
- **Social Media:** [TikTok](https://www.tiktok.com/@swoop_ai) · [Instagram](https://www.instagram.com/swoop_ai/) · [Facebook](https://www.facebook.com/SwoopAI/) · [X](https://x.com/Swoop_ai/)
- **Legal & Compliance:** [Privacy Policy](https://www.swoop.ai/privacy) · [Terms of Use](https://www.swoop.ai/terms-of-use)
- **Fastbreak Product Links:** Fastbreak Amateur Sports Platform · Fastbreak Ticketing

---

## 4. Technical Notes

### Data Layer

- **Source:** fb_compete schema. All event data will be sourced from the fb_compete schema
- Compete has existing tables and views we can utilize. Collaborate with Compete devs

### API Design

- Endpoints designed by the Swoop team; will consult with Kyle for any feedback
- API will handle data aggregation, filtering, and transformation logic
- Allows frontend to remain agnostic to underlying data structure changes

### UI Architecture

- UI layer only responsible for displaying data — minimal to no business logic
- UI components are intentionally designed to match what's being built by Compete. Should collaborate with Compete devs to see what can be reused
- Landing page pulls "default" filtered event data on load for specific sub-sections (e.g. "This Weekend" — request filtered by date)
- **Initial data ranking (location preferences):** (1) User provides location, (2) User provides browser tracking permissions, (3) Fallback to reverse IP search geolocation, (4) Bottom priority: nationwide search, chronologically

### SEO

- Broad support for full user experience event tagging using GA4 events
- Follow best practices for headers, meta tagging, OG tags, etc.
- Adhere to standards for crawler parsing; JSON-LD and microformats
- Data on core pages should be accessible via RSS

