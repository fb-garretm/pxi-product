# Swoop Roadmap Detials

| Field | Value |
|-------|-------|
| Source | https://fastbreak.atlassian.net/wiki/spaces/ASPAD/pages/995262466 |
| Format | confluence |
| Imported | 2025-03-03 |

---

# PXI OWNERSHIP VIEW

### Platform Roadmap Interpretation and Responsibilities

### TLDR

PXI owns the platform surfaces and must use this brief to pressure-test architecture, not ship decisions. This can stay high level, but we need to think hard because the answers will shape the next 2 to 3 releases. By Monday, we need shared clarity on domain strategy, CMS boundaries (static vs dynamic), vanity domain ownership and TXT verification, and whether Event Listing, Operator Sites, CMS, and mobile surfaces live in one repo, multiple repos, or a monorepo with hard boundaries. February through April 2026 is the foundation window. If we do not lock the fundamentals early, downstream work on operator sites and white-labeled apps will stall or fragment.

| Project |  | Primary Months | Description | Related Systems / Projects |
|---|---|---|---|---|
| Swoop Event Listing Site | **PXI Ownership** | March 2026 | Canonical, centralized web listing for all FB events including metadata and scraped data. SEO-first and source of truth for event pages. (Phase 2-3, Legacy compete, Scraped) | CMS, Operator Sites, Mobile App Event Listing, CRM |
| CMS (Operator CMS Platform) | **PXI Ownership** | Apr 2026 | Content management system for operator sites. Controls pages, branding, media, and limited configuration without touching core logic. Drag and dropper tool as well with 2-3 templates for layout. | Event Listing Site, Operator Standard Sites, Operator Customizable Sites |
| Messaging (Mobile) | **PXI Ownership** | March2026 | In-app messaging for participants, parents, coaches, and operators. Channels/Groups/Announcements/Push Notifications | CRM, Mobile App Event Listing |
| Messaging Web Administration | **PXI Ownership** | Apr 2026 | Admin interface for managing and monitoring messaging activity. | Messaging Mobile, CRM |
| White-Labeled Apps | **PXI Ownership** | June 2026 | Branded mobile apps built as simplified versions of the core Fastbreak app for specific customers. | Mobile App Event Listing, Messaging, CRM |
| Parent and Athlete UX | Shared (PXI Integrator) Club | Mar–Apr 2026 | End-user experience for parents and athletes across web and mobile. | Event Listing Site, Mobile App, Messaging |
| Coach UX | Shared (PXI Integrator) Club | Mar–Apr 2026 | Coach-facing workflows including teams, rosters, and communications. | CRM, Messaging, Team Management |
| Waivers and Document Management | Shared (PXI Integrator) Club | Feb–Mar 2026 | Upload, manage, and associate waivers and documents to events and registrations. | Registration and Checkout, CMS, CRM |
| Seasons, Event, Program Management, Registration, Checkout | Shared (PXI Integrator) Club | Feb–Apr 2026 | Full lifecycle management for seasons, programs, events, and registration flows. | Payments, CMS, Event Listing Site, Mobile App |
| Marketing (Email and SMS) | Shared (PXI Integrator) Club | Feb–Apr 2026 | Campaigns and notifications tied to event lifecycle and registration triggers. | CRM, Messaging, Registration |

## Project Decomposition Thinking Table

| Project / Area | What We Know Today | How It Connects to Others | Repo Questions We Must Ask | Open Questions to Challenge |
|---|---|---|---|---|
| Event Listing Site (Web) | Canonical listing of all events, SEO-first | Feeds operator sites, CMS pages, mobile app, white-labeled apps | Is this its own repo? Or a surface inside a shared web repo? Does it share components with operator sites? | Is this a product or a surface? Does it own routing or consume it? |
| Operator Standard Site | Templated site, minimal customization | Consumes event data, branding, global layout | Same repo as Event Listing? Or separate app in monorepo? | What truly differentiates this from Event Listing at a code level? |
| Operator Custom Site (CMS) | Same base as standard site, plus CMS that has templates to choose from | Builds on operator site, pulls from CMS | Same repo as standard operator site with flags? Or separate CMS-driven app? | Is CMS a layer or a separate application? |
| CMS (Platform) | Manages content, branding, pages for the operator | Feeds operator sites and possibly event pages | Is CMS its own repo or a package used by multiple apps? | Static vs dynamic CMS? Who enforces boundaries? |
| Vanity Domains (CMS) | Custom domains for operators | Routes to operator CMS sites | Infra repo? CMS repo? Web repo? | Do we build tooling or guide customers manually? Can we sell domains? |
| Domain and DNS Handling for the Custom Sites (CMS) | Needs TXT verification and CNAME routing | Tied to CMS, operator sites, TLS | Infra repo or shared service? | Who owns verification? How automated do we go? |
| Mobile App (Core) | Consumer-facing Fastbreak app | Consumes same event, CRM, messaging APIs. Will heavily rely on Club experience. | Separate repo already, but shares logic? | What is truly shared with white-labeled apps? |
| White-Labeled Mobile Apps | Branded versions of core app | Same APIs, reduced feature set | Separate repos per client? Or single repo with config? | How do we avoid fragmentation and drift? |
| Messaging | Mobile and web admin surfaces in club | Depends on CRM and user roles | One repo or split mobile/admin? | Is messaging a platform service or feature layer? |
| Team Management | Teams, rosters, invites | Tied to CRM, roles, events | Lives with event logic or CRM? | How do we connect UX with us in mobile?? |

## 1. One Big Repo vs Many Small Ones (PXI Scope)

We need to challenge repo structure **only for PXI-owned web and mobile surfaces**.

**Questions to ask**

- What PXI code must be shared across Event Listing, Operator Sites, and CMS?
- What PXI code should explicitly *not* be shared?
- What breaks if PXI teams deploy these surfaces independently?
- What slows PXI down if everything lives in one tightly coupled repo?
- Where do we need hard boundaries even inside a monorepo?
The likely answer may be a monorepo with hard boundaries, but PXI needs to prove that through facts, not assumption.

## 2. Event Listing, Operator Sites, and CMS Relationship (PXI-Owned)

These three are all PXI-owned, but the relationship is still ambiguous.

**Questions to ask**

- Is the Event Listing site a distinct PXI product or just another operator-facing surface?
- Is an Operator Standard Site simply a filtered view of the Event Listing site?
- Does the CMS feed both Event Listing and Operator Sites, or only Operator Sites?
- Who owns routing decisions across these three surfaces?
- Does one surface become the "source&rdquo; and the others consumers?
The answers here directly drive whether this is one repo, multiple apps in a monorepo, or separate repos.

## 3. CMS Model: Static vs Dynamic (PXI-Owned)

This is a PXI operational decision, not a purely technical one.

**Questions to ask**

- What PXI-managed content truly needs to be dynamic at runtime?
- What PXI content can be statically generated and cached?
- Which PXI teams absorb the operational cost of dynamic CMS?
- What failure modes do we introduce if CMS becomes dynamic by default?
- Can PXI enforce static-first without blocking future needs?
PXI should default to static unless there is clear evidence otherwise.

## 4. Vanity Domains and TXT Verification (PXI-Owned Process)

Vanity domains are a PXI responsibility because they touch routing, CMS, and operator sites.

**Questions to ask**

- Does PXI build automation for TXT verification or provide guided manual steps?
- Does PXI own the process end-to-end or only validate customer actions?
- Does PXI ever sell domains directly or always require customer-owned domains?
- Where does this logic live: web repo, CMS repo, or infra repo?
- How do we prevent domain handling from leaking into multiple PXI projects?
This work cuts across PXI web, CMS, and infra concerns and should not be treated as an afterthought.

## 5. Mobile App vs White-Labeled Apps (PXI-Owned)

Both are PXI-owned mobile surfaces, but with different constraints.

**Questions to ask**

- Is white-labeling a configuration problem or a repo separation problem?
- What is the minimum shared PXI mobile layer between core and white-label?
- How does PXI prevent feature drift between core and white-label apps?
- Do white-labeled apps ever introduce CMS or domain complexity?
- How does PXI manage release cadence without fragmentation?
The wrong structure here creates long-term maintenance debt for PXI.

## 6. PXI Cross-Cutting Concerns (Limited to PXI Surfaces)

These are concerns PXI owns only where they touch PXI-managed surfaces.

**Questions to ask**

- Which PXI features are truly platform-level across web and mobile?
- Where do PXI-owned schemas live versus consumed schemas?
- How does PXI ensure reuse without tight coupling?
- What should exist as shared packages versus application-level code?
- Where does PXI draw the line between "platform&rdquo; and "surface&rdquo;?
This is where repo boundaries matter most.

## What PXI Should Do Next

### Thinking, Not Building

- Inventory **only PXI-owned repos** and what actually lives in them today
- Map each PXI-owned surface to:

- 
Current repo
- Desired future home
- Identify shared PXI packages versus PXI applications
- Write down opinions and explicit tradeoffs
- Only then decide:

- 
Where to harden
- Where to split
- Where to keep things together
## Bottom Line

This brief exists to force **PXI architectural thinking before commitment**.

We are not asking:

- What do we build?
We are asking:

- How do PXI-owned things actually fit together?
- Where should PXI-owned code live?
- What assumptions is PXI making without evidence?
