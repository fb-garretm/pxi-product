# Swoop Partner UI – Brand Partners + Organizational Partners

| Field | Value |
|-------|-------|
| Source | https://fastbreak.atlassian.net/wiki/spaces/ASPAD/pages/760479754 |
| Format | confluence |
| Imported | 2025-03-03 |

---

**Scope & Product Requirements for Design**

## 1. Overview

Swoop supports two major partner types:

- **Brand Partners**
(Advertisers, sponsors, marketing-driven partners &mdash; typically via Connect)
- **Organizational Partners**
(Cities, facilities, clubs, event owners &mdash; typically working with Swoop Media)
Both believe they *are* a brand and want a controllable brand presence in the ecosystem. Because of that, we use a **shared Partner Profile model**, but unlock different modules based on partner type.

The UI should feel identical across both, with components/modules toggled on/off based on permissions.

# 2. Shared Core Partner Capabilities (Both Groups)

Regardless of partner type, every partner gets:

### A. Partner Page Management

They can fully manage how their brand shows up in Swoop:

- Logo/avatar
- Cover image
- Brand name
- Description/tagline
- CTA link
- Optional video or feature section
- Preview & publish
Both brands and organizations obsess about their brand identity, so this must be polished, modern, and reliable.

### B. Media Hub

Every partner can access the media tied to them:

- Photos/videos produced for their events or their sponsorship
- Bulk download
- Filters by event, date, contractor, media type
- Asset-level analytics (views, plays, downloads)
- Watermarked + edited versions
For **Brand Partners:**
Media = sponsored content & watermarked brand media.

For **Organizational Partners:**
Media = all event-level content produced under Swoop Media for their events.

### C. Promotions Manager

All partners can create/manage promotions:

- Up to 9 active
- Image/video upload
- Title + description
- Link (typically to their site or sponsor page)
- Placement selection
- Drag-to-reorder
- Activate/deactivate
- Analytics per promotion
This applies to both:

- Brands promoting offers
- Events/cities promoting programs, facility info, seasonal campaigns, etc.
# 3. Analytics Modules

Analytics UI is shared. We simply show empty states where data doesn't apply.

### A. Promotion Analytics

- Impressions, reach, clicks, CTR
- Performance by placement
- Export
### B. Partner Page Analytics

- Page views
- Unique visitors
- CTA clicks
- Trend lines
### C. Media Analytics

- Most viewed assets
- Photo/video engagement
- Downloads
- Event-level performance
### D. Survey Insights

Only if the partner is tied to survey CTAs:

- Brand lift
- Sentiment
- Responses to travel/economic questions
- Funnel metrics: Seen &rarr; Started &rarr; Completed
### E. Pulse Impact Analytics

(For Pulse org partners)

- Visitor origin markets
- Hotel nights
- Estimated economic impact
- Travel patterns
Brands see this only if they're part of a Pulse activation.

# 4. Organizational Partner–Specific Capabilities

### A. Event Management

Organizations can:

- Submit an event
- Manage event metadata (title, sport, dates, description, cover images)
- Upload/assign their watermark
- See job status (if applicable)
- Track contractor progress
- View gallery performance
### B. Financials

If an organization is a Swoop Media partner:

- View event-level revenue
- Stripe payout reports
- Org-level sales dashboard
- Filters by event, date range, product type
- Revenue share breakdown (if applicable)
### C. Media Access for Hosted Events

Organizations get access to all event photography/video produced by Swoop Media for their events.

# 5. Partner Segmentation Model (UI Logic)

We will support multiple partner *segments*, each unlocking or hiding UI modules:

### Segment 1 &mdash; Brand Partner (Connect)

- Promotion creation + analytics
- Media Hub (sponsored content)
- Partner Page editor
- Survey analytics (if applicable)
- No event management
- No financials
### Segment 2 &mdash; Organizational Partner (Swoop Media)

- Promotion manager
- Partner Page editor
- Full Media Hub (event content)
- Full event submission & management
- Financial dashboard
- Pulse analytics (if applicable)
- No brand-sponsor lift metrics unless they're explicitly sponsoring themselves
### Segment 3 &mdash; Hybrid (Brand + Org)

Some partners do both (e.g., a facility that is also a sponsor).
They see all modules.

# 6. UI Components Needed (Unified Across All Partner Types)

### A. Dashboard (Home)

- Key stats
- Most recent promotions
- Recent media highlights
- Shortcuts to: Promotions, Media Hub, Analytics, Events
### B. Partner Page Editor

- Logo, hero image
- Brand name
- Description
- CTA link
- Optional feature blocks
- Preview mode
### C. Promotions Manager

- Grid of active promotions
- Drag to reorder
- Promo creation modal
- Placement selection
- Analytics preview
### D. Analytics Suite

- Nav filters
- Charts
- Date selector
- Export controls
- Empty states when a module doesn't apply
### E. Media Hub

- Grid
- Filters
- Download options
- Search
- Asset analytics
### F. Event Management (Org Only)

- Event list
- Event creation form
- Event detail page
- Contractor progress bar
- Gallery preview
### G. Financials (Org Only)

- Revenue summary
- Event-level revenue table
- Payout reports
- Download/export
### H. Settings

- Add/remove team admins
- Branding settings
- Notification preferences
- API keys if needed later
# 7. Summary for Design

Design one **unified Partner UI** with:

- **A shared component library**
- **Modular sections that can be toggled on/off**
- **Clear permissions that define what a user sees**
- **Shared visual hierarchy** between Brand Partners and Organizational Partners
This keeps engineering simple, gives a consistent UX, and still respects the differences between sponsors, brands, cities, events, and org partners.
