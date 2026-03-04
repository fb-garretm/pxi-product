# Fastbreak Club PRD

| Field | Value |
|-------|-------|
| Source | Pasted by user |
| Format | pasted |
| Imported | 2025-03-03 |

---

# Fastbreak Club

**Youth sports club operations management**

| Field | Value |
|-------|-------|
| Date | Feb 12, 2026 |
| Status | DRAFT |
| Confidential | Yes |

---

## 1. Introduction

This document breaks down the product requirements of the Club Platform. The goal is to address the need to replace the current fragmented set of tools used by youth sports operators. Youth and amateur sports clubs rely on disconnected tools to manage operations and run their organizations. These systems are often poorly integrated, require duplicate data entry, and lack clear role-based access, creating operational inefficiencies. As clubs scale, these challenges compound — leading to missed payments, eligibility issues, compliance risks, and poor overall experience for families and staff.

The proposed Club Platform will allow clubs and organizations to centralize core operational workflows—such as season/program setup and management, registration, team formation, scheduling, communication, payments, and compliance—within a single system. By providing role-based experiences for administrators, coaches, parents, and athletes, the platform aims to improve operational efficiency, reduce manual workflows, and deliver an intuitive experience that scales with the needs of clubs as they continue to grow. This PRD outlines the platform's objectives, core features, user experiences, and constraints to guide design, development, and delivery.

### 1.1 Goals

- **Reduce administrative burden for club staff** — Minimize manual workflows
- **Improve parent and athlete experience** — Single source of truth for team info, communication, schedules, and registration
- **Increase operational efficiency and visibility** — Give club leadership real-time insight into their organization
- **Role-based access for all users**
- **Streamline communication across the club** — Web and club app functionality; reduce fragmented and lost communication (team and club-wide messaging)
- **Support complex club structures** — Multi-team, multi-division, multi-season, multi-location clubs and organizations
- **Enable scalable growth for clubs** — Performance that scales with number of teams and athletes
- **Increase compliance and risk management**

### 1.2 Success Metrics

- Decrease in use of external tools
- % of families logging in weekly during the season
- % of teams with completed rosters before season start
- % decrease in number of athletes participating with incomplete registration / compliance requirements
- % of communication sent via the platform vs external tools
- Time to onboard a new operator / organization
- % of families completing onboarding without help
- Decrease in late or missing waiver/documentation incidents

### 1.3 Connection to the Fastbreak Ecosystem

The Club Platform is the operational hub for youth sports operators, centralizing core data and workflows that power and connect to other amateur products. Club manages organizations, teams, rosters, eligibility, and season structure, and connects that foundation to **Compete** (registration, schedules, seeding, results); to the **Club App (Swoop)** for parent, athlete, and coach experiences (registration, schedules/calendar, messaging, team/roster management); to **Travel** for coordinating club travel logistics tied to events and team schedules; and to **Billing** for unified payments, invoicing, and financial tracking across programs, seasons, teams, and households. Together these internal product integrations eliminate duplicate data entry, ensure consistency across the Fastbreak ecosystem, and enable clubs to operate efficiently at scale while delivering a connected, end-to-end experience for administrators and families.

**Related projects:** Amateur Payments PRD · Club App PRD

### 1.4 Target Users & Primary Objectives

| Role | Primary objectives |
|------|--------------------|
| **Club Admins** | Operational efficiency, visibility, control, risk reduction. Configure club structure, seasons, programs, registration, pricing. Manage staff, teams, payments, compliance. Club-wide communication. |
| **Coaches** | Manage rosters, schedules, attendance/availability. Communicate with teams and families. Track athlete eligibility. View and complete eligibility/compliance requirements. |
| **Parents / Guardians** | Visibility, clarity, transparency, ease of use. Register athletes and manage household accounts. Pay fees and track balances. Stay informed with team communication chats. |
| **Athlete** | Awareness and engagement. View team schedule(s) and announcements. Participate in team communication (if enabled). |

### 1.5 Core Entities

| Entity | Description |
|--------|-------------|
| Club | Organization that runs teams, seasons, programs and events |
| Program | A collection of events or other programs. A program that contains programs is a season. Also linked to teams |
| Event | Game, practice, training, tournament, camp, clinic, etc. |
| Team | Group of athletes competing together |
| Division | A set of constraints on a team or program (min/max age, min/max participants, etc.) |
| Roster | Team assignment/membership record |
| User | Authenticated person using the platform |
| Household | A collection of users representing a family unit |
| Role | Defines permissions within a context (club, team, household) |
| Registration | Record of a user's registration to a program |
| Registration form | A form/waiver that a user fills out to register for a program |
| Document | An uploaded document (pdf, jpg, etc.) a user uploaded as part of program registration |
| Payment | Financial transaction |
| Message | Communication sent to users or groups |

---

## 2. Solution and Scope

### 2.1 Fastbreak's Solution

Fastbreak Club is a centralized club management platform purpose-built for youth and amateur sports organizations. It replaces fragmented tools with a single system that streamlines administrative workflows and delivers a cohesive experience for admins, coaches, parents, and athletes.

The MVP focuses on the core operational needs required to successfully run a club season end-to-end. The platform centralizes operations for club administrators, coaches, athletes, and parents—covering registration, team formation, rosters, scheduling, calendars, payment processing, communication, eligibility/compliance tracking, and staff management.

By consolidating these essential capabilities into a single intuitive platform, Fastbreak Club reduces administrative overhead, improves data accuracy, and delivers a smoother, more transparent experience for families and staff—laying a strong foundation for future expansion beyond the MVP.

### 2.2 Core Features

| Feature name | Summary |
|--------------|---------|
| Club Setup / Onboarding | Operators establish the organization's core information, settings, and preferences needed to support all downstream workflows (seasons, programs, registration, team formation, scheduling, payments) |
| Season & Program Creation / Management | Operators create, configure, and manage seasons and programs that define offerings, drive registration, support team formation and scheduling, and serve as the operation backbone for reporting and payments |
| Admin Registration Configuration | Operators configure program registrations with full control over structure and validation while ensuring alignment with club policies, eligibility rules, and scalable operations |
| Player registration, due payment & onboarding | Self-service registration and onboarding so parents can input all necessary athlete information with clear CTAs to complete registration and household account |
| Team & roster management | Operators build, manage, and maintain team rosters throughout a season—from initial team formation and registration after tryouts through mid-season adjustments and transfers. Reduces manual admin work and prevents eligibility and capacity issues |
| Team offers | Operators send trackable, athlete-specific team offers enabling families to accept or decline, complete registration, and set up season payments |
| Staff assignments | Operators invite, assign, and manage coaches and staff with defined roles, permissions, and compliance tracking across all club activities |
| Scheduling & calendar | Operators create, manage, and publish centralized schedules and calendars across teams, programs, and facilities, keeping staff and families aligned in real time |
| Payments & invoicing | Operators collect, track, and reconcile revenue accurately and transparently through a unified system for payments and invoicing |
| Reporting | Operators gain access to real-time insights for operations, participation, and financials to support data-driven decision making and administrative oversight |
| Team Chats & Announcements (Web and In-App Messaging) | Centralized communication channel to send targeted updates, reminders, and announcements to the right audiences |
| Role-based user permissions | Operators define and enforce clear permissions boundaries across admins, parents, athletes, and coaches |
| Eligibility tracking / Compliance Tracking | Centralizes and enforces eligibility and compliance requirements to prevent ineligible participation and provide real-time status visibility for admins, coaches, and parents |
| Waivers / Document Management | Operators securely collect and manage waivers and required documents through registration and request workflows to ensure compliance and acknowledgement before participation |

### 2.3 Out of Scope — Future Phases

| Feature name | Summary |
|--------------|---------|
| Stats & performance analytics | Track, visualize, and analyze athlete and team performance data over time |
| Age Verification | Automated verification of athlete age and eligibility |
| Media upload / sharing | Secure uploading and sharing of photos and videos between clubs, teams, athletes, and families |
| Uniforms & Club/Team Stores | Integrated storefronts for team uniforms, spirit wear, club merchandise |
| Customizable Club Websites | No-code tool for clubs to create and manage branded public-facing websites powered by live club data |
| Outbound Marketing Communication | Centralized tools for targeted marketing campaigns via email, SMS, push |
| Background Checks | Integrated background screening workflows for coaches, staff, volunteers |
| Athlete Evaluations | Structured evaluation tools for tryouts, team placement, in-season development |
| NGB Membership Validation | Automatic validation and tracking of required NGB memberships |
| Automated Schedule Optimization | Optimized schedule management accounting for availability, travel, facilities, conflicts |
| Schedule Builder | Coaches create event schedules with existing Fastbreak and external events for travel, cost, tuition estimates |
| External event calendar integration | Syncing of third-party event calendars into club/team schedules |
| Facility Management | Facility availability, booking, conflicts, inventory |
| Lesson Booking | Self-service scheduling and payment for private/small-group lessons |
| Payables | Outbound payments to coaches, facilities, officials, vendors |
| Recruiting Profiles / Services | Athlete recruiting profiles, highlight sharing, college coach visibility (permissions and age eligibility) |

---

## 3. Functional Requirements

### 3.1 Feature Requirements

#### Club setup / Configuration / Onboarding

- Create and manage club profile (org name, logo, sport(s), location, contact information)
- Configure club-wide settings: Age group/division definitions, gender divisions
- Define payment settings: accepted payment methods, payment/installment plans, refund/credit policies
- Define communication defaults: email sender info, notification preferences, user permissions (staff, parent, athlete)
- Invite staff (admins) and set permissions

#### Season & program creation / management

- Create time-bound seasons
- Create programs within a season
- Assign pricing and payment options per program
- Create events within a season/program (practice, training, games, tournaments)
- Configure program settings: capacity limits, age group, grade, division, skill level

#### Admin Registration Configuration

- **Registration form builder** — Admins create and manage registration forms by season, sport, program/event, and team. Configurable field types (text, number, dropdown, multi-select, file upload, checkbox acknowledgement). Required/optional, helper text, field ordering (and grouping?). Parent-managed athlete registrations → require parents to have an attached athlete profile.
- **Eligibility** — Set eligibility constraints per program and division: age/gender. Skill level or division selection. Capacity limits and waitlist thresholds. Duplicate athlete prevention. Attach waivers to a registration.
- **Fees** — Configurable registration fees by program, age group/division, team, or athlete. Ability to require payment to complete registration.
- **Registration controls** — Admins can open, close, or pause registrations. Invite-only or approval-based registration (private links?). Waitlist configuration with auto-promotion rules. Duplicate previous registration configurations.

#### Parent/Athlete registration & onboarding

- Online registration forms with configurable form fields
- Parent/guardian account creation and invite functionality
- Player profile creation
- Program details, selection, and registration
- Document upload / request submissions. Waiver acceptance
- Registration status tracking (draft state?)
- Automated confirmation and reminders

#### Team & roster management

- Create teams under a program/season. Assign roster limits. Assign players to teams. Move players between teams. Track roster status. View roster history per season.

#### Team Offers

- Create offers tied to athlete profile/household, season/program, and team (age group/division, roster capacity)
- Offer details: team name, season association and dates, commitment deadline, tuition/fees, payment plan options, scholarships (if applicable)
- Draft vs sent status → allow for scheduled offers. Delivery channels: Email (Parent & athlete recipients if enabled). Offer preview before send. Data tokens for customization (team name, athlete name, team cost, registration link). Resend offer capability. Delivery status tracking.
- Accept/decline CTA button. Automatic roster assignment on acceptance. Confirmation prompt for offer acceptance/declines. Notify club admins on offer declines (replacement offer) → keep decline data for reporting.
- Configurable expiration date/time → countdown visible to parent and admins. Automatic expiration behavior → status: expired, spot: released. Admin override for deadlines. Role-based permissions for sending offers.

#### Staff assignments / invites

- Create staff profiles. Send staff invites. Assign roles (admin or coach). Configure staff permissions (toggle with default suggested permissions). Assign staff to seasons, programs, teams. Track staff eligibility and compliance.

#### Scheduling & calendar

- Create events → support predefined and custom event types. Assign events to season, programs, teams, locations, staff. Support recurring events (daily, weekly). Conflict detection. Calendar views (day/week/month). Calendar sync (iCal, Google, Outlook). Attendance tracking.

#### Payments & invoicing

- Program-based pricing. Payment plans (assign to org, season, program, team, athlete/household). Pay-later. Automatic invoice on registration. Batch invoice creation. Payment status tracking. Refund and credits. Payment reminders. Financial reporting by season, program, team.

#### Reporting

- Dashboard. Real-time and batch reports. Custom report builder. Dynamic reports. Reports for: Registration counts by program, Roster counts by team, Payment summaries, Outstanding balances, Payment Plans, Eligibility/Compliance Status. Filter by season, program, team. Export CSV. Role-based access to reports.

#### Team Chats & Announcements (Web and In-App Messaging)

- Club-wide announcements. Targeted announcements — by role, team, program (segments). Multi-channel delivery (In-app, web, email, SMS). Scheduled announcements. 1:1 messaging (admin ↔ staff, coach ↔ parent). Group chats (team-based, staff only). Message history retention? Permissions configuration for athletes. Notifications controls.

#### Role-based user permissions

- Predefined roles: club admins, coach, parent/guardian, athlete. Custom roles with configurable permissions. Granular permissions: view, create, edit, delete. Role assignment per season/program? Audit log for permission changes/activity. Roles assignable at multiple levels (club-wide, program, team, event). Permissions configurable at feature and action level (view, create, edit, delete, approve). Permission sets apply consistently across web and mobile. Role changes take effect immediately without reauthentication. Permission errors return clear, non-technical messages (e.g. "You don't have access to edit this roster"). Storage: secure (PII-compliant), download and view permissions by role.

#### Eligibility tracking / Compliance Tracking

- Define compliance requirements: age, documents, payments, certifications. Track status per player and staff. Block participation if non-compliant. Allow admin override. Automated reminders for expiring items — to admins, parents, coaches. Filterable compliance dashboards for admins, coaches, parents/athletes (households). Filter by: Club, team, season, event; Non-compliant, expiring documents.
- **Configurable eligibility rules** — Governing body, League/Event/Tournament, Age group, gender, division, level. Effective date ranges (rule changes year by year). Versioning and audit history for rule changes. Rule inheritance: Org level → season/program level → team level. Real-time eligibility status. Support multi-team athletes & coaches, multi-org athletes & coaches. Review queues and approval states. Cross-team compliance reuse (one background check, multiple teams).
- **Blocking logic** — Prevent assignment if non-compliant. Allow provisional assignment (configurable). Event-specific compliance checks. Exportable, event-ready rosters.
- **Integrations** — Governing body: membership verification/certification sync. Background check providers. APIs for read/write eligibility status. Granular permissions: viewing vs approving documents, accessing PII. FERPA/COPPA/GDPR considerations.

#### Waivers / Document Management

- Upload and store documents. Document types: waivers, medical forms, proof of age. Digital signature support. Versioning and expiration tracking? Link documents/requests to: Season, program, player, staff.

### 3.2 User Permissions

Permissions are configurable at the admin, team, and household level for every user type. Admins can create permission templates in global settings and toggle on/off specific feature sets for each invited user.

#### Admin (Club / Org Staff)

Admins can be global or limited to specific orgs/teams/programs/features.

| Org-level | Team-level | Household-level |
|-----------|------------|-----------------|
| Create/edit/archive Org | Assign/remove coaches | Impersonate household |
| Create/edit/delete seasons/programs | Assign/configure coach permissions | Edit athlete profiles |
| Invite/assign staff/roles/permissions | Override roster limits | Adjust invoice balances, credits, refunds |
| Configure permission templates | Approve/deny roster changes | Override registration requirements |
| Manage integrations | Team formation / athlete team assignment / team offers | — |
| Manage branding / public pages | Move athletes between teams | — |
| View/export all data | Create team-specific forms / document requests | — |
| View audit logs & activity history | View team financials | — |
| Manage/edit global settings | Manage/edit team invoices | — |
| Sending club-wide communication | — | — |
| Registration build/configuration | — | — |
| Configure payment rules & pricing | — | — |
| Create/edit/delete invoices | — | — |
| Manage waivers | — | — |
| Document Requests | — | — |
| Create/view registration reports | — | — |
| Create/view revenue reports | — | — |

#### Coach

Coaches can be assigned to one or more teams.

| Org-level | Team-level | Household-level |
|-----------|------------|-----------------|
| View club-wide announcements | View and manage team roster | View athlete emergency information |
| View shared training content | Invite/remove athletes (if admin permissions assigned) | View parent contact information |
| Manage notification preferences | Edit athlete jersey numbers/positions | Message parent 1:1 |
| — | Message athlete 1:2+ (parent attached) | — |
| — | Create/edit team events (if admin permissions assigned) | — |
| — | Cancel or reschedule team events | — |
| — | See athlete availability | — |
| — | Send messages to team / subgroups / individual parents & athletes | — |
| — | Share media / files | — |
| — | View basic athlete profiles | — |
| — | Track athlete attendance | — |
| — | Enter team / athlete stats / performance notes | — |
| — | View team-level reports (attendance, player development)? | — |
| — | Assign tasks | — |

#### Parent / Guardian

Parents belong to a household and may be attached to multiple athletes.

| Org-level | Team-level | Household-level |
|-----------|------------|-----------------|
| View club announcements | View assigned team schedule(s) | Manage household account |
| Browse program offerings | RSVP / set athlete availability | Add/remove guardians |
| Register athletes | View coach announcements | Add/edit/remove athlete profiles |
| View org policies & documents | Send/receive team chat messages | Complete forms/waivers |
| — | Message coaches 1:1 | Upload documents (from document requests) |
| — | View team roster (limited view) | Manage payments — add payment methods, view invoices/balances, set up payment plans, refund/credit requests |
| — | View shared files/media | Request athlete program transfers |
| — | Comment / react (if enabled) | Manage/assign athlete communication permissions |
| — | — | Manage/control what data is visible to coaches/teams/other team parents |
| — | — | Manage notification preferences |

#### Athlete

Belong to a household and have limited permissions.

| Org-level | Team-level | Household-level |
|-----------|------------|-----------------|
| View club-wide announcements | View assigned team schedule(s) | View own profile |
| Browse program offerings | RSVP / set self availability | Edit profile fields (limited edit access) |
| Self-register for programs (if age eligible) | Send/receive team chat messages | Manage notification preferences |
| — | Message coaches | — |
| — | View roster (limited view) | — |
| — | Post in team channels? | — |
| — | Complete assigned forms/waivers (if enabled) | — |
| — | View personal stats | — |

### 3.3 User Workflows

Club User Flows — [Figma](https://www.figma.com) *(link to be added)*

### 3.4 User Stories

*(To be added)*

### 3.5 Acceptance Criteria

*(To be added)*

### 3.6 Edge Cases

*(To be added)*

### 3.7 User Interface — User Journeys

| Role | Primary goals | Core journey |
|------|---------------|--------------|
| **Admin** | Set up and run club efficiently, ensure compliance, maintain financial + operational visibility | Create club → Configure seasons/programs → Register players → Invite staff → Build teams & send offers → Operate season/programs → Communicate with families/teams → Monitor, manage & report |
| **Parent** | Register athlete(s), stay informed, manage payments, communicate easily | Create account → Register athlete → Invite additional users to household → Pay fees → Stay informed → Communicate → Manage athlete compliance |
| **Athlete** | Stay informed on schedule, team updates, announcements; participate in team chats (access limited by age, parental consent, club policies) | Join team → View schedule → View announcements / Participate in team chats (based on permissions) → Manage eligibility/stay compliant |
| **Coach** | Manage team operations, communicate with families, focus on coaching | Invited to Org → Assigned to team → Manage roster → Schedule calendar events → Communicate → Track athlete compliance → Manage eligibility/stay compliant |

Complete overview of user journeys for club admins, parents, athletes, and coaches: *(Figma links and screenshots to be added)*

### 3.8 User Experience

*(Add Figma links and screenshots)*

---

## 4. Non-Functional Requirements

*(To be added)*

---

## 5. Page Examples

Most youth sports club management platforms have outdated navigation patterns, cluttered UI, and UX not tailored for specific user roles. These platforms are not optimized for efficiency or clarity for admins, coaches, parents, and athletes.

**LeagueApps** and **TeamSnap** are the most commonly used club management platforms in youth sports. **Sprocket Sports** and **PlayerFirst** have more user-friendly interfaces.

**Screens captured from:**

- https://clubvsports.sprocketsports.com/dashboard
- https://leagueapps.com/
- https://my.sportngin.com/user/household
- https://www.playerfirsttech.com/
- https://www.teamsnap.com/

### Household / Accounts / Profiles

- **Sprocket Sports — Club V:** Household, Athlete Profile, Parent Profile / Account Info
- **SportsEngine:** Household — Parent Account and Athlete Profile
- **Player First:** Org Switcher
- **TeamSnap:** Account Settings, Household

### Dashboard Views

- **League Apps:** Parent Dashboard View
- **PlayerFirst:** Admin Dashboard View
- **TeamSnap:** Coach Dashboard

### Parent Registration / Program Listing

- **Sprocket Sports — Club V**
- **TeamSnap**

### Schedule / Calendar

- **Sprocket Sports — Club V**
- **Public Calendar Views**
- **TeamSnap:** Team Schedule View

### Staff & Permissions

- **SportsEngine HQ:** HQ Tool Permissions — Staff; Staff Memberships / Waivers / Eligibility

### Team Formation / Roster Management

- **TeamSnap:** Rostering Dashboard

### Messaging

- **TeamSnap:** Send Emails
