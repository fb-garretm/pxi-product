# OSS Template PRD

| Field | Value |
|-------|-------|
| Source | /Users/garretmann/Downloads/OSS Template PRD.docx |
| Format | docx |
| Imported | 2025-03-03 |

---

# Requirements Specification — Operator Standard Site (OSS)

# 1. Overview

The Operator Standard Site (OSS) is a template-based website provided to tournament operators upon sign-up with Fastbreak. It serves as a public-facing discovery and information layer, enabling visitors to browse the operator's events, view event details, and proceed to registration on Compete.

Operators can customize their site with a logo, primary color, and content—but not layout or structure. The site lives at {org-slug}.sites.fastbreak.ai and is publicly accessible without authentication.

**Sprint Goal:** Provide tournament operators with a standardized, publicly accessible web presence to promote their events and drive visitor registration on the Fastbreak AI platform. It acts as a discovery and information layer, offering a balance between operator branding and a consistent site structure. Ready by March 11, 2026.

**Key Dates:**

- Sprint Planning / Ticket Grooming: Feb 26
- Scoping and Planning End: Mar 2
- Self-grooming / discovery / research / design + dev clarifications: Mar 2 - 4
- Development: Mar 4 - 11
- Code Freeze: Mar 11 EOD
- QA Dev Begins: Mar 12
- Staging Release: Mar 18
- Production Release: Mar 18

## 1.1 Site Structure

The OSS consists of three pages and a persistent navigation bar:

- **Home Page** — Hero banner, upcoming events grid (12 cards, paginated), tournament locations map, and about us section
- **Events Page** — Full event search with filter panel, mirroring the existing Fastbreak event listings site scoped to the operator
- **Event Details Page** — Reuses the existing Fastbreak event details component, living under the operator's OSS URL

The navigation bar contains four items: Home (navigates to Home page), Events (navigates to Events page), About (anchor link to Home page About Us section), and Locations (anchor link to Home page Tournament Locations section).

## 1.2 Admin Panel

A new OSS Admin Panel allows operators to configure their site's branding and content. This is separate from the existing event management admin platform (which is already built and out of scope). Operators configure: logo, primary color, organization name, about us text, social media links, and optionally contact email and phone number.

## 1.3 Key Integration Points

Event data (names, dates, locations, divisions, pricing, etc.) is sourced from the existing event APIs established for event listing site. The Event Details page and event card components are reused from the existing event listings site. The registration CTA hands off to the Compete registration flow. Tournament locations on the map are derived from event location data, not separately configured.

- OSS Template Figma
- CMS Onboarding Figma

# 2. Requirements

## 2.1 URL & Access

Each OSS shall be accessible at {org-slug}.sites.fastbreak.ai

**Acceptance Criteria:**

- ✓ URL uses the operator's organization slug as the subdomain
- ✓ Site is publicly accessible without authentication
- ✓ Slug is unique per operator and URL-safe (lowercase, hyphens only)

Custom domain mapping is out of scope for the OSS tier.

## 2.2 Navigation

A persistent navigation bar shall appear on all pages containing the operator's logo and four nav items: Home, Events, About, and Locations

**Acceptance Criteria:**

- ✓ Home navigates to the Home page
- ✓ Events navigates to the Events page
- ✓ About scrolls to (or navigates to) the About Us section on the Home page via anchor link
- ✓ Locations scrolls to (or navigates to) the Tournament Locations section on the Home page via anchor link
- ✓ Navigation is responsive and collapses to a mobile-friendly menu on smaller viewports

## 2.3 Home Page

### Hero Section

The Home page shall display a hero banner featuring the operator's organization name

**Acceptance Criteria:**

- ✓ Hero background will always be black (future will use photo)
- ✓ Organization name is prominently displayed and centered. Org logo at the top left
- ✓ Hero section is responsive and scales appropriately across devices

### Upcoming Events Section

The Home page shall display an "Upcoming Events" section below the hero showing up to 3 rows of event cards with pagination

**Acceptance Criteria:**

- ✓ Events are displayed in a responsive grid (4 columns on desktop, adapting to fewer on smaller screens)
- ✓ Pagination controls appear at the bottom when more than one page of events exists
- ✓ Each page shows up to 3 rows of event cards

A "See All" link shall appear in the top-right of the section, navigating to the full Events page. Filter dropdowns shall be available at the top of the section for: Registration Status, Event Status, and Gender. Each event card shall display: event image/logo, event name, organization name, date range, location, starting price, guaranteed matches, sport type badge, and divisions/age groups (same as event listing site).

**Acceptance Criteria:**

- ✓ Clicking an event card navigates to the Event Details page for that event

If the operator has no upcoming events, an empty state message shall be displayed.

**Acceptance Criteria:**

- ✓ Message communicates that no upcoming events are currently available
- ✓ The section still renders (is not hidden) with the empty state message

### Tournament Locations Section

The Home page shall display a "Tournament Locations" section with an interactive map

**Acceptance Criteria:**

- ✓ Map displays pins for all cities associated with the operator's events
- ✓ A list of locations appears alongside the map showing city/state and tournament count
- ✓ Location data is auto-populated from the operator's event data (not manually configured)
- ✓ Clicking on a row w/ a city/state should open the event search page with the city filter selected for the clicked on city/state

### About Us Section

The Home page shall display an "About Us" section with the operator's configured about text

**Acceptance Criteria:**

- ✓ Text content is pulled from the operator's OSS admin configuration
- ✓ Section has an anchor ID so the "About" nav item can link directly to it

### Footer

All pages shall display a footer containing: organization name, navigation links (Home, Events, About, Locations), platform links (Terms of Use, Privacy Policy, Referral Program, Become a Sponsor), social media icons linking to operator-configured accounts, and "Powered by Fastbreak AI" branding.

Platform links (Terms of Use, Privacy Policy, Referral Program, Become a Sponsor) shall link to Fastbreak platform pages, not operator-configured URLs. The "Powered by Fastbreak AI" branding shall be non-removable in the standard tier.

## 2.4 Events Page

The Events page shall display all events belonging to the operator with full search and filter capabilities, mirroring the existing Fastbreak event listings site scoped to this operator's events

**Acceptance Criteria:**

- ✓ Reuses existing event listing components
- ✓ Events are scoped to only this operator's events

A search bar shall allow users to search events by keyword. Have the ability to search by date. A filter panel shall be displayed on the left side (desktop) with the following filter categories: Search Radius, Team Gender, Sport, Event Status, Event Type. Filters that have only one available option across the operator's events should be hidden if feasible.

**Acceptance Criteria:**

- ✓ Example: If the operator only runs basketball events, the Sport filter is hidden
- ✓ Filter visibility is determined dynamically based on the operator's event data

A "Clear All" option shall reset all active filters. Pagination shall be provided at the bottom of the results grid. The events grid shall be responsive, adjusting columns for different screen sizes.

## 2.5 Event Details Page

Clicking an event card (from Home or Events page) shall navigate to a dedicated Event Details page

**Acceptance Criteria:**

- ✓ The Event Details page reuses the same component as the existing Fastbreak event listings site
- ✓ Content is scoped to the selected event
- ✓ The page lives under the operator's OSS URL (does not redirect to the event listings site)

The Event Details page shall include all standard event information: event name, dates, location(s), divisions, schedule, pricing, registration status, and all other details present on the existing event listings detail page. A registration CTA shall be present and shall hand off to the existing Compete registration flow.

**Acceptance Criteria:**

- ✓ User is taken to the registration system within Compete
- ✓ Registration behavior is identical to the existing event listings site

## 2.6 OSS Admin Panel

### Configurable Fields

The admin panel shall allow operators to configure the following fields:

**Acceptance Criteria:**

- ✓ Behaves exactly how the existing CMS onboarding screen does and be accessible using 'settings' in the editor
- With the exception that the theme chooser: this will change primary color only. We will provide choices; if they want they can pick a custom color. Picking a custom color will show language to pass the liability if the color they choose is not ADA compliant. Upload gallery image is removed.

### Admin Panel / onboarding flow UX

The admin panel / onboarding flow shall present a form with all configurable fields, a Save button, and validation feedback

**Acceptance Criteria:**

- ✓ Remains unchanged to what we have now for CMS with the exception of the configurable fields above

### Publish Flow

When the user completes onboarding and is taken to the CMS to see the editor and their site

**Acceptance Criteria:**

- ✓ This page should behave exactly like it does now, with the following changes below
- ✓ This screen should have a shell (navigation bar) that is consistent with compete v2
- ✓ The CMS customizable sections on right of the screen as shown in the screenshot should be greyed out with a CTA to 'Request Pro Upgrade', contact us will reference general fastbreak ai support email. Clicking will open a draft email with the general support address pre-filled
- ✓ On the top left under the Compete shell (navigation bar) there will be Design and settings. Design is highlighted when a user sees the design of the site like in the screenshot below. Settings takes them back to the admin panel / onboarding flow (where they enter configurable information)

## 2.7 Responsive Design

All pages and components shall be fully responsive across desktop, tablet, and mobile viewports

**Acceptance Criteria:**

- ✓ Event card grids adapt column count based on viewport width
- ✓ Navigation collapses to a hamburger or mobile-friendly menu
- ✓ Filter panel on the Events page adapts for mobile (e.g., collapsible or modal-based)
- ✓ Map and locations section is usable on touch devices
- ✓ All text remains readable without horizontal scrolling

## 2.8 OSS Primary Color Usage

All components affected by primary colors:

- "See All" button against Upcoming Events — [Figma Reference](https://www.figma.com/design/30UuoLDzH7DEcgYZnOWy36/Event-Listing-Site?node-id=3193-40593&t=l6jSo3G1ARUg1RDB-11)
- Header selected state
- Icons in "Contact Us" — [Figma Reference](https://www.figma.com/design/30UuoLDzH7DEcgYZnOWy36/Event-Listing-Site?node-id=3193-40693&t=l6jSo3G1ARUg1RDB-11)
- CTA buttons — [Figma Reference](https://www.figma.com/design/30UuoLDzH7DEcgYZnOWy36/Event-Listing-Site?node-id=3262-50658&t=l6jSo3G1ARUg1RDB-11)
- Mobile — (see Figma for mobile primary color usage)
