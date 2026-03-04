# Swoop Media Organization Portal PRD (MVP)

| Field | Value |
|-------|-------|
| Source | https://fastbreak.atlassian.net/wiki/spaces/ASPAD/pages/778076170 |
| Format | confluence |
| Imported | 2025-03-03 |

---

**Product Requirements Document (PRD)**

## 1. Objective

Build a secure, self-service Organization Portal for SWOOP Media event organizations. The portal must support two primary entry paths:

- **Existing Fastbreak Customers**
Organizations already using another Fastbreak product (e.g., ticketing, registration, Pulse, etc.) must be able to log in with their existing account and automatically access events tied to their organization.
- **New Customers**
New Organizations must be able to receive an invitation, complete onboarding, create their organization profile, and begin submitting or importing events into the SWOOP ecosystem.
The portal must enable Organizations to submit new events, pull in events that already exist in other Fastbreak systems (when available), access and download captured media, and track financial performance for all events they operate with SWOOP.

This portal is the foundational interface Organizations will use to provide event data, monitor event success through revenue and engagement metrics, and retrieve the media SWOOP captures. It serves as the external counterpart to the SWOOP Admin Portal and integrates directly with the media ingestion pipeline, event metadata layer, and revenue reporting systems.

## 2. Background

SWOOP Media captures and sells photos at youth and amateur sports events. Organizations need a reliable way to see:

- How their events are performing financially
- What media was captured
- The operational status of events they have scheduled with SWOOP
Today, Organizations rely on email, text, or manual communication from Fastbreak staff. This does not scale.

The Organization Portal provides controlled access to event content and financial data, removing friction and giving Organizations transparency in real time.

## 3. User Roles

### 3.1  Organization (Partner)

- Organization's C-Suite
- Tournament directors
- Facilities and venue operators
- Clubs, leagues, governing bodies
- Media Organizations
### 3.2 Organization Staff

- Operations Teams
- Marketing teams
- Venue Owners
- Finance departments
### 3.3 SWOOP Admin Portal (Internal)

- Reviews and approves events
- Controls Organization access rights
- Manages event associations
## 4. Core Features

### 4.1 Authentication and Access Control

**Requirements**

- Email + password login

- 
How does EET and Compete handle this?   
- Optional: Google SSO
- Organization-level accounts with multiple users
- Role-based permissions (Owner, Manager, Finance, Guest)?

- 
How does EET and Compete handle this?   
- Users must be associated with a verified Organization 
- Strict event-level scoping: Organizations can only access events tied to their organization

- 
What do we do in Admin portal to ensure this ^?
- Note: We will need to be able to track these reports on our end from admin or stripe 
**Purpose**
--> Ensures only authorized organizations view media of minors and sensitive financial data.

### 4.2 Organization Dashboard (Home)

A consolidated view giving Organizations a snapshot of their relationship with SWOOP.

**Dashboard modules:**

- Revenue summary (lifetime, month-to-date, week-to-week)
- Upcoming events
- Recently completed events

- 
Financial
- Events requiring approval or additional information
- Notifications feed (approvals, upload issues, payout updates)

- 
Design general and answer and ask more question about this please?
### 4.3 Event List and Event Detail Views

#### Event List View

Features:

- Tabs for Upcoming, Live, Completed
- Search and advanced filters (date, sport, venue, status)
- Key details per event:

- 
Event name
- Date range
- Status
- Total photos uploaded
- Revenue to date
- Location
- Venue
#### Event Detail View

Sections:

- **Event Overview**

- 
Core metadata
- Assigned photographers
- Upload progress indicators
- **Media Access**

- 
Full album &rarr; gallery &rarr; photo structure
- Thumbnail browsing
- Bulk download support
- Download permissions controlled per Organization
- Search by filename or tags
- **Financials**

- 
Total revenue
- Revenue share calculations
- Average order value
- Order count
- Discounts/promotions (if applicable)
- **Engagement Metrics**

- 
Photo views
- Scans (face/jersey AI)
- Downloads
- Traffic source attribution
### 4.4 Organization Event Submission

Organizations must be able to submit future events to SWOOP directly through the portal.

**Create Event Form:**

- Event name
- Start/end dates
- Venue, city, state
- Sport
- Estimated number of teams/participants
- Optional cover image
- Optional custom watermark
- Notes for the Fastbreak team
**Workflow:**

- Submitted events enter "Pending Review&rdquo;
- SWOOP Admin reviews and approves or requests changes
- Upon approval, the event is linked to the Organization org and prepared for operations
### 4.5 Media Library Access

Provides Organizations with a controlled version of the Swoop consumer gallery.

**Capabilities:**

- Hierarchical browsing (event &rarr; album &rarr; gallery &rarr; photo)
- Fast, optimized thumbnail rendering
- Full-resolution downloads or bulk downloads

- 
Download link or straight to zip via browser
- Full album download

- 
Download link upon approval sent to their email

Set an expiration for each link.
- Tag-based filtering (venues, photographers, dates)
- Internal secure link sharing for Organization teams
- Set limit for photography downloads??? 
**Future Enhancements (Phase 2):**

- Favorite collections
- Basic editing tools
- AI content summaries
### 4.6 Financial Dashboard

A standalone financial reporting view.

**Metrics:**

- Total revenue
- Revenue share (percentage + payout amounts)
- Revenue per event
- Daily revenue trends
- Top-performing events
**Downloads:**

- CSV export
- Payout ledger
- Invoice/receipt downloads
**Admin Controls:**

- Manual adjustments
- Override revenue share values
- Upload reconciliation files
### 4.7 Notifications and Alerts

Organizations receive alerts for:

- Event approvals and Updates

- 
Cancellation, Location update, date time   please add notes here.
- Upload completion
- Payout processing
- Organization account updates
- Contractual or policy notices
Notification methods:

- In-portal
- Email (optional Phase 2)
## 5. Integrations

- **Stripe** – Revenue share calculation, payouts, and transaction reporting
- [Swoop.ai](http://Swoop.ai) - deep linking
- **Swoop Admin Portal** – Event metadata, Organization associations, approval workflows

- 
**Swoop Media Pipeline** – Source of truth for albums and photo assets
- **Unified Organization & Universal Login ** – Standardized method for ingesting Organization-submitted event data
## 6. Security Requirements

- RBAC enforcement
- Multi-user organization structure
- Event-scoped access validation
- Secure media URLs with expiration
- Audit trail for:

- 
Logins
- Media downloads
- Financial exports
- Compliance with SOC2-aligned best practices
## 7. QA Requirements

- Authentication
- Event submission flow
- Event-level access restrictions
- Media browsing and downloading
- Financial calculations &rarr; are the right #s being displayed
- Media rendering
- Download performance
- Album structure integrity
- CSV export verification
- Test users with different levels of access or way to set different roles for users.
- Ledger info on financial transactions to very accounting is correct.

I know I'm going to need more but I currently can't think of it at all. Sooooo TBD -Jay

## 8. Milestones and Release Plan

**M1 – Authentication + Event List**
User login, org association, event list baseline.

**M2 – Media Access**
Album &rarr; gallery &rarr; photo browsing + downloads.

**M3 – Financial Dashboard**
Revenue summaries, trends, and exports.

**M4 – Event Submission**
Organization-to-admin workflow for upcoming events.

**M5 – Notifications + Polish**
Quality improvements, alerting, UI refinements.
