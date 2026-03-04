# SWOOP Roadmap

| Field | Value |
|-------|-------|
| Source | https://fastbreak.atlassian.net/wiki/spaces/ASPAD/pages/810450946 |
| Format | confluence |
| Imported | 2025-03-03 |

---

| **Product** | **Prefix** | **Current Release** | **Next Release** |
|---|---|---|---|
| Swoop Mobile & Portal | **SM** | **SM-R3** | SM-R4 |
| Swoop Web ([http://Swoop.ai](http://Swoop.ai) )Event Listing | **SW** | **SW-R3** | SM-R4 |

| **Release Name** | **        Product** | **Target Date** | **Release Type** | **Primary Goal** |
|---|---|---|---|---|
| R4 - Cleanup / Under-the-Hood | Swoop Mobile App + Supporting Portal |  | Platform / Architecture | Stabilize platform, move to API-first, improve security and scalability |
| R4 - Cleanup / Under-the-Hood | Swoop Web  ([http://Swoop.ai](http://Swoop.ai) ) |  | Platform / Architecture | Align web app to shared APIs and Universal Login |
| R5 – Event Listing in SWOOPpublic.events | Swoop Web  ([http://Swoop.ai](http://Swoop.ai) ) | Dev -  Code Freeze -   Prod | Product Integration | Display all FB events but specifically Compete events and metadata in event directory on web app. |
| R6 – Club in Swoop + CMS | Swoop Mobile  + Supporting Portal |  | Engagement / Retention | Enable in-app messaging, club communications, and custom apps |
| R6 – Club in Swoop + custom apps | Swoop Web  ([http://Swoop.ai](http://Swoop.ai) ) |  | Engagement / Retention | Read-only club presence and announcements |

| **Swoop Release Cycle** |
|---|
| **Stages 1** | **Stage 2** | **Stage 3** |
| Dev, Docs & Flow"Approval&rdquo; | **Part 3**Code Freeze | **Part 6**Staging to Prod |
| **Part 2**Dev | **Part 4**Testing in Dev | -  Release |
| &nbsp; | **Part 5**Dev to Staging | Finalizing Scope |
| **Scoping Next Release** |

## NEXT Release SM-R4: Cleanup / Under-the-Hood

**Target Window:** Feb 2026
**Release Type:** Platform + Architecture
**Goal:** Unify with other Fastbreak products and introduce stability by making Swoop API-first, introducing new RLS roles, and implementing Universal login. We will deliver this by .

### P0 &mdash; Must Ship (Release Blocking)

#### Platform & Architecture

- Decouple APIs from Swoop into a separate API-only repo and service
- Mobile app consumes only APIs (no direct database access)
- Introduce versioning mechanism / escape hatch for APIs

- 
 - Add mobile API Router
#### Auth & Identity

- Universal Login (single identity across Swoop/Fastbreak ecosystem)
- Phone OTP association integrated into Universal Login
- Tie **phone number** to a **Club User**
- Remove UUID-based associations
- Ensure all users properly populate into `public.users`

- 
 what are the required fields for the above?

First Name, Last Name
- Phone
- Email - Verification Required?
- Password
#### Orgs & Data Model

- Introduce **Org Type ID**
- 
- 
Normalize org handling across Swoop

 - Can we reuse the event organizer org type or is this ticket specific?
#### Security

- RLS role cleanup

- 
Admin - Fastbreak Employees 
- Contractor
- Mobile User
- Guest
- Club Admin???
- New policy formatting for Swoop schema
- Full list of roles defined and reviewed
- Roles passed to  for validation
- Supabase token handling standardized

### P1 &mdash; Important but Non-Blocking

#### Platform Hygiene

- Cleanup existing repos
- Cleanup database tables (remove legacy / dead paths)
**Android**

- Android! 
#### Observability

- Google Analytics
- Scale/Spike Stress Testing
- Datadog
- Help Desk

- Web Event Listing

- 
Centralized web-based listing of all events, including event metadata and scraped data.
- Mobile App Event Listing/Messaging

- 
The same event data and listings surfaced within the Fastbreak mobile app, optimized for mobile use.
- Operator Standard Sites

- 
Standard, templated website for operators, with no customization beyond branding and no CMS access.
- Operator Customizable Sites (CMS)

- 
Enhanced version of the standard operator site, allowing customization, branding, and content management through a CMS.
- Customer Specific Mobile App

- 
Fully branded, standalone mobile app built as a simplified version of the core Fastbreak app, offering a focused subset of features tailored to a single customer or operator.
