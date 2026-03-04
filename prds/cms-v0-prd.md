# CMS V0 PRD

| Field | Value |
|-------|-------|
| Source | Pasted by user |
| Format | pasted |
| Imported | 2025-03-03 |

---

# Fastbreak CMS

This doc outlines where we're heading with the CMS that will power event and team sites across the platform. It captures the current thinking on architecture, editing UX, and component structure, along with how we're handling site rendering and publishing.

It's not a full spec — more of a working reference to align on responsibilities, surface open decisions early, and make the system easy to scale as new roles come on board.

---

## Objective

The Fastbreak CMS is being developed to allow event organizers and team organizations to create modern, branded, data-driven websites. It gives users the ability to manage content, showcase upcoming events, and support transactions like registration and product sales, all powered by the Fastbreak platform.

The CMS is not a standalone system; it is a presentation and editing layer that dynamically renders structured data (events, products, rosters) provided by the platform. It is designed to support both short-term MVP requirements and long-term scalability into new domains such as merch sales, sponsorship placements, and dynamic media generation.

---

## MVP Scope

The first production milestone will deliver a fully functional CMS layer that supports:

- Dynamic websites for event organizers (then team organizers soon after)
- Subdomain-based routing (e.g. `springtipoff.sites.fastbreak.ai`)
- Basic support for custom domains (via Vercel domain API)
- Site creation triggered by organization creation (`event_org` or `team_org`)
- Pre-templated pages composed of editable sections
- Inline content editing (text, media, linked data like events or rosters)
- Support for rendering event registration as a purchasable product
- Real-time updates using Supabase as the source of truth

All sites will be rendered via the CMS using shared layout and rendering logic, pulling structured data from the Fastbreak platform.

---

## CMS System Architecture

The CMS is built on six modular, scalable layers:

### 1. Component Configuration Layer

- Central registry of all supported UI components (e.g. `event_list`, `hero_banner`, `team_roster`)
- Each component defines its props, field types, editability, and output format
- This config layer allows engineers to add new content types without rewriting layout logic

### 2. Section Storage Layer

- A section is a real instance of a component with saved content and data references
- Stored in Supabase, scoped to a `page_id` and `site_id`
- Supports editable fields and dynamic content references (event IDs, product IDs)

### 3. Page Model Layer

- Pages are linear collections of sections with a route (`/home`, `/schedule`, etc.)
- Pages belong to a site and are rendered dynamically by the CMS

### 4. Site Model Layer

- A site groups pages and global configuration (theme, analytics, domain)
- Each site is owned by an account (`event_org` or `team_org`)
- All public requests are scoped by domain/subdomain to the correct site

### 5. Rendering & Editing Layer

- Pages are rendered using Next.js and Supabase
- Inline editing mode overlays inputs on editable fields
- Drag-and-drop for section ordering and visibility toggling
- Admin UI writes directly to Supabase — no draft/publish flow for MVP

### 6. Publishing & Hosting Layer

- Sites are deployed on Vercel and resolved via middleware (subdomain or domain lookup)
- Vercel Domain API will be used to support custom domains (SSL, DNS verification)
- Sites are rendered live from database content — no pre-generation or re-deploy needed

---

## Proposed Data Model (First Pass)

This schema reflects the current CMS architecture and content flow plan. It is designed for modularity, role-based editing access, and alignment with the existing Fastbreak schema.

### Ownership & Permissions

| Table | Purpose |
|-------|---------|
| **organizations** | Represents the owner of a CMS-managed site. Can be of type `event_org` or `team_org`. Tied to domains, products, and content. |
| **jct_organization_access** | Join table mapping users to organizations with roles (e.g. admin, coach, parent). Used for eventual editing permissions and site access. |

### CMS Site Structure

| Table | Purpose |
|-------|---------|
| **sites** | Represents a website tied to an organization. Includes subdomain, optional custom domain, theme config, and site-wide settings. |
| **pages** | Represents a routable view (`/home`, `/roster`, `/schedule`) for a given site. Ordered collection of sections. Includes metadata and visibility rules. |
| **sections** | Represents a single visual block on a page (e.g. Hero Banner, Event List). Each section is an instance of a `component_type` and stores editable props. |
| **section_templates** (optional) | Predefined combinations of `component_type` + default props and layout variants. Used to streamline content creation by offering curated section starting points. Selecting a template creates a new section instance seeded with its values; sections are fully editable afterward. |
| **components_config** | System-level registry of all available component types. Each config defines: **editable fields** (controls which fields users can modify via the editing UI), **prop types** (string, image, richtext, or references to platform data e.g. `event_ids`, `team_ids`), **data fetching rules** (source table, filters, sort), **output targets** (web, print, graphic), **optional interactivity** (embedded workflows e.g. checkout, form submission; feature gating by org type). |

---

## Page Rendering Overview

At runtime, the CMS dynamically resolves and renders each site:

1. Middleware parses the domain or subdomain to find the matching site
2. The requested page and its ordered sections are loaded from Supabase
3. Each section maps to a `component_type` and is rendered with its saved props
4. Layout variations and editability rules are applied per section
5. Pages are server-rendered via Next.js for performance
6. If a logged-in user has editing access (via `jct_organization_access`), fields are rendered with editing controls enabled

---

## UX Editing Model

Content editing in the CMS is structured around **site → page → section → component**. Editors do not work with low-level components; they interact with predefined, purpose-built sections using contextual form inputs.

### Key Behaviors

- Templates preload editable pages with commonly used sections (e.g. "Hero Banner", "Event List")
- Field-level editing allows users to update text, images, links to platform data (events, products), and toggle visibility
- Layout and styling logic is abstracted, ensuring visual consistency and preventing unintended structural changes
- Future support may include the ability to insert or swap sections from a curated library of templates

### Ideal Editing Interface

- **Inline editing** will be supported on the public-facing site for authorized users (e.g. org admins). This allows real-time content updates in context.
- A **dedicated admin interface** within the Fastbreak Compete dashboard will also be introduced to manage global settings, shared sections (e.g. nav, footer), and full-page structures across the site.

This model enables site admins to self-manage content while maintaining structure and brand consistency, and it scales to support both quick edits and deeper configuration.

### Section Templates & Visual Variants

Many components (e.g. "About," "Event List," "Hero Banner") will support multiple visual layouts. These layout variants are configured via a `layout` prop in the component schema (e.g. `image_left`, `video_background`, `text_only`).

In the CMS editing interface, these variations will be presented as pre-configured section templates, allowing users to choose from curated design options without managing layout settings manually. These templates are not separate component types; they are styled instances of the same underlying component, seeded with different default props.

This approach balances consistency (single render logic) with flexibility (visual variety), and gives the CMS team the ability to roll out new layout options without expanding the component registry.

---

## Supported Section Types for MVP

The following sections will be supported in the initial CMS launch. Each section corresponds to a reusable component and will be editable via the admin interface.

### Event Organizer Site Sections

| Section | Description |
|---------|-------------|
| **Hero Banner** | Image + headline + CTA |
| **Event List** | Dynamically linked to published events |
| **Event Detail** | Title, date, location from platform. Organizer can optionally add description, logo, and featured image |
| **Registration Block** | Displays product price and links to platform checkout |
| **About the Team** | Text + image layout |
| **Media Gallery/Carousel** | Uploaded photos or embedded videos |
| **Sponsor Strip** | Row of sponsor logos |
| **Contact Info** | Optional contact form or link to external page |

Each of these is backed by a `component_type` defined in the `components_config` table and stored as a section instance on a given page.

---

## Ownership & Engineering Boundaries

### CMS Engineer Owns

- Component and section rendering system
- Inline editing UI and content-saving logic
- Page and site templating (with per-role restrictions)
- Middleware routing (domain/subdomain resolution)
- Domain configuration and Vercel API usage
- Integration of real-time updates from Supabase
- Long-term maintainability of the CMS library (usable across multiple apps)

### Platform Engineer Owns

- Event creation and configuration flows
- Product creation and linking to events
- Checkout logic and Stripe payment integration
- Registration flows and transactional data
- User auth/session management
- Exposing structured data for CMS to render

---

## Strategic Extensions (Beyond MVP)

- **Team/Club Sites:** Full templates with customizable sections and options for publishing team websites with rosters, events, schedule, media, and eventually athlete registration
- **E-commerce expansion:** Registration is modeled as a product type, supporting future product types like merch, digital content, or sponsorships
- **Fulfillment models:** Future products will use dynamic fulfillment flows (e.g. team signup vs physical shipment)
- **Split payments:** For team registration, system may support per-player payment handling in future
- **AI enhancements:** Copywriting, layout suggestions, and automated media generation (e.g. social graphics, printed signage)
- **Multi-format output:** Sites may eventually output to print, signage, or mobile formats — all using the same data structure
