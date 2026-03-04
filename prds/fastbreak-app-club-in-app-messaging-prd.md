# Fastbreak App: Club and In-App Messaging PRD

| Field | Value |
|-------|-------|
| Source | Pasted by user |
| Format | pasted |
| Imported | 2025-03-03 |

---

# Fastbreak App — Club App and In-App Messaging

| Field | Value |
|-------|-------|
| Date | Feb 13, 2026 |
| Status | DRAFT |
| Confidential | Yes |

---

## 1. Introduction

This document breaks down the product requirements of Club features in the Fastbreak App. The goal is to address the need to replace the current fragmented set of tools used by youth sports operators, coaches, and families. Youth and amateur sports clubs rely on disconnected tools to manage operations and run their organizations. These systems are often poorly integrated, require duplicate data entry, and lack clear role-based access, creating operational inefficiencies. As clubs scale, these challenges compound — leading to missed payments, eligibility issues, compliance risks, and poor overall experience for families and staff.

The proposed Club features in the Fastbreak App will allow clubs and organizations to offer a single source of truth for their coaches and families including communication, schedules, rosters, travel, ticketing, and event photos. The app aims to empower clubs to deliver timely, targeted communication; give coaches simple, permission-aware tools to manage teams; and provide families with clear, real-time visibility into schedules, rosters, and updates across all their athletes. By combining easy announcements, automated reminders, role-based access, and multi-team views into a seamless experience, the Fastbreak App reduces administrative overhead, eliminates missed information, and helps clubs operate more professionally—so everyone can focus less on logistics and more on the game.

### 1.1 Goals

- **Reduce administrative burden for club staff** — Minimize manual communication and schedule workflows
- **Improve parent and athlete experience** — Single source of truth for team info, communication, schedules, and registration
- **Increase operational efficiency and visibility** — Role-based access for all users
- **Streamline communication across the club** — Web and club app; reduce fragmented and lost communication (team and club-wide messaging)
- **Support complex club structures** — Multi-team, multi-division, multi-season, multi-location
- **Enable scalable growth for clubs** — Performance that scales with number of teams and athletes
- **Increase compliance and risk management**

### 1.2 Success Metrics

- Decrease in use of external tools
- % of families logging in weekly during the season
- % of communication sent via the platform vs external tools
- Time to onboard a new operator / organization
- % of families completing onboarding without help
- Decrease in late or missing payments and forms (docs/waivers)

### 1.3 Connection to the Fastbreak Ecosystem

The Club Platform is the operational hub for youth sports operators, centralizing core data and workflows that power and connect to other amateur products. Club manages organizations, teams, rosters, eligibility, and season structure, and connects that foundation to **Compete** (registration, schedules, seeding, results); to the **Club App (Swoop)** for parent, athlete, and coach experiences (registration, schedules/calendar, messaging, team/roster management); to **Travel** for coordinating club travel logistics tied to events and team schedules; and to **Billing** for unified payments, invoicing, and financial tracking across programs, seasons, teams, and households. Together these integrations eliminate duplicate data entry, ensure consistency across the Fastbreak ecosystem, and enable clubs to operate efficiently at scale.

**Related projects:** Fastbreak Club PRD · Amateur Platform x Swoop Figma

### 1.4 Target Users and Primary Objectives

| Role | Primary objectives |
|------|--------------------|
| **Club Admin** | Club-wide announcements; roster & team organization; schedule management (org and team level); payment reminders (automated for payment plans / pay later); consistent message delivery across coaches/parents/teams |
| **Coach** | Fast team messaging (team chat); schedule/roster visibility; attendance/availability tracking; share plans, updates, videos; controlled parent/athlete communication (based on admin permissions) |
| **Parent/Guardian** | Clear schedules; real-time schedule updates; easy access to documents/rosters; direct messaging to coaches (if enabled); team chat; registration/payments; visibility into club program offering; RSVP/availability for team events |
| **Athlete** | Visibility into practice/game/event schedule; real-time updates; learning materials/player development resources; team chat; RSVP/availability for team events |

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
| Document | An uploaded document (pdf, jpg, etc.) as part of program registration |
| Payment | Financial transaction |
| Message | Communication sent to users or groups |

---

## 2. Solution and Scope

### 2.1 Solution Statement

Swoop x Club provides a unified, role-aware communication and scheduling platform purpose-built for youth sports organizations. It replaces disconnected tools with a single system that embeds communication directly into club operations, ensuring every message, schedule update, and reminder reaches the right audience at the right time. Through intelligent announcements, automated notifications, permission-based access, and multi-team visibility, Swoop x Club gives clubs centralized control, equips coaches with simple, compliant tools, and delivers families a clear, real-time view across all their athletes. By establishing a trusted source of truth, the platform reduces administrative overhead, eliminates missed or duplicated information, and enables clubs to scale without sacrificing consistency, privacy, or the athlete experience.

### 2.2 Core Features

| Feature | Summary |
|---------|---------|
| **Communication** | Announcements, Team Chats, Direct Messaging, Automated Messages (Reminders), Permissions Configuration |
| **Schedule** | Club/Org-Wide Schedule, Team Schedules, Calendar Sync, Availability / Attendance Tracking |
| **Team Rosters** | Player & parent rosters, visibility controls |
| **Registration** | *(Via club platform)* |
| **Payments** | *(Via club platform)* |

### 2.3 Out of Scope — Future Phases

- Message tagging (urgent, FYI, schedule change)
- Team Feed / Bulletin Board
- Share images, documents, videos, training plans
- Document Hub — player paperwork (waivers, medical forms), team rules, playbooks, tournament guides, upload and distribute files
- Player evaluations & feedback (coaches)
- In-app registration
- Team formation tools / Evaluations
- Media galleries
- Registration redirect to club platform through Swoop

---

## 3. Detailed Requirements

### 3.1 Feature Requirements

#### Announcement Broadcasting (Club → Groups)

**Requirements**

- Club admins can send announcements to: Entire club; Divisions (age group, gender, program); Individual teams; Custom segments (e.g. "All parents with unpaid balances", "18s parents")
- Announcement supports: Title + rich text body; Optional attachments (PDF, image); Optional links
- Delivery channels: In-app notification (default); Email (opt-in per user); SMS (opt-in + compliance aware)
- Admin can preview audience size before sending. Admin can schedule announcements for future delivery. Open and delivery status visible to admins

**UX Notes:** Clear confirmation on who is receiving the message/announcement before sending for admins. Announcements appear in a dedicated "Announcements" feed (not mixed with chat) for all users.

#### Coach-to-Team Messaging

**Requirements**

- Coaches can only message their assigned team(s). Coaches cannot message athletes directly without a parent attached.
- Messages support: Text, Attachments. Delivered via: In-app; Optional email/SMS fallback based on user settings. Coaches cannot message outside their assigned teams.

**UX Notes:** Coach messages visually labeled as "Coach". Pinned messages for critical info — coaches can set messages as urgent/important.

#### Push Delivery & Notifications

**Requirements**

- Notification types: Announcements, Messages, Schedule changes, Reminders
- User-level preferences: In-app only, Email, SMS. Granular toggles per notification type.
- Automatic push triggered by: New message; Event added/updated/canceled; Assignment to a team?; Payment or registration deadlines

**UX Notes:** First-time onboarding flow asks users to set preferences. Clear labeling of "urgent" notifications.

#### Automated Reminders

**Requirements**

- System-generated reminders for: Practices, Games/events, Registration deadlines, Payments due
- Reminder timing: Default (e.g. 24h + 2h before); Club-configurable; User override (optional). Delivery respects user notification preferences.

#### Group Messaging (Team Chat)

**Requirements**

- Team-level chat available by default once athletes/coaches are assigned to rosters on web. Athlete access: Configurable per club or per team. If enabled, athletes can: Read messages; Send messages (optional restriction). Admins can disable chat entirely per team.

**UX Notes:** Clear participant list (coaches, athletes, adults from household). Athlete accounts visually distinguished from parents/coaches.

#### Direct Messages (DMs)

**Requirements**

- Supported DM types: Parent ↔ Parent (optional, club-configurable); Coach ↔ Parent/Guardian; Coach ↔ Parent + Athlete (group DM). Permissions: Coaches cannot DM athletes directly unless parent included (configurable).

**UX Notes:** Safeguards for youth communication baked into permissions. Clear indication of who can see the message.

#### Practice & Game/Event Schedule Display

**Requirements**

- Users see schedules relevant to their athlete(s) and role (parent, athlete, coach). Event details: Date/time, Location (with map link), Team(s) associated, Notes (e.g. uniform color, arrival time). Support for: Cancellations; Time/location changes with auto-notification.

#### Single-Team Event Creation

**Requirements**

- Coaches/admins can create events for their team(s). Required: Event type (practice, game, meeting), Date/time, Location. Optional: Notes, Attachments. Changes trigger automatic notifications.

#### Multi-Team Parent View

**Requirements**

- Parents with multiple athletes can: View all events in a unified calendar; Filter by athlete or team. Conflict highlighting: Overlapping events visually flagged.

**UX Notes:** "Family calendar" default view. Color-coded teams for clarity.

#### Calendar Sync

**Requirements**

- One-click subscription: Google Calendar, Apple Calendar (iCal), Outlook. Sync: Read-only; Auto-updates when events change. Per-athlete and combined calendar options.

#### Player & Parent Rosters

**Requirements**

- Team roster: Athlete name, Jersey number (optional), Parent/guardian names (private to team members), Contact info (visibility controlled by club). Privacy: Hide emails/phone numbers if disabled by club.

#### Coach Permissions

**Requirements**

- Coaches can: View roster for assigned teams; Message team members; Create/edit team events. Coaches cannot: Access other teams; View sensitive parent data unless permitted.

#### Parent/Guardian Linking

**Requirements**

- Athletes linked to multiple parents/guardians. Each guardian: Independent login; Independent notification preferences. Guardians can manage: Registration, Payments, Communication settings, Athlete profiles?

#### Multi-Team Athlete Support

**Requirements**

- Single athlete can belong to multiple teams (e.g. practice squad + travel team). Schedule, messages, and notifications aggregate across teams. Clear team context on every message and event.

#### Cross-Platform Requirements

- Role-aware UI (parent vs athlete vs coach). No dead ends (every notification links to context). Safety-first communication defaults. Mobile-first, but desktop-friendly.

---

### 3.2 User Permissions

**Legend:** F/A = Full access · CON = Conditional/configurable · R/O = Read-only · N/A = No access

#### Communication

| Feature / Story | Admin | Coach | Parent | Athlete |
|-----------------|-------|-------|--------|---------|
| Club-wide announcements | F/A | R/O | R/O | R/O |
| Division / team announcements | F/A | CON (assigned teams only) | R/O | R/O |
| Custom segment announcements | F/A | R/O (if included) | R/O (if included) | R/O (if included) |
| Coach-to-team messaging | CON (enable/disable, moderate) | F/A | R/O | R/O |
| Group team chat | CON (enable/disable, moderate) | F/A (moderate) | CON (participate) | CON (optional) |
| Parent-to-parent messaging | CON (configure) | N/A | CON (if enabled) | N/A |
| Athlete messaging | CON (enable/disable, moderate) | CON (if enabled or if parent included) | CON (if enabled) | CON (if enabled or in team chat) |
| Push notifications | CON (configure rules) | CON (opt-in/out) | CON (opt-in/out) | CON (opt-in/out) |
| SMS / email delivery | CON (enable & configure) | R/O | CON (opt-in/out) | CON (opt-in/out) |
| Automated reminders | F/A | R/O | R/O | R/O |

#### Scheduling / Calendar

| Feature / Story | Admin | Coach | Parent | Athlete |
|-----------------|-------|-------|--------|---------|
| Create/edit schedules | F/A | CON (if enabled and/or assigned teams only) | N/A | N/A |
| View schedules | F/A | CON (assigned teams only) | R/O | R/O |
| Multi-team parent view | N/A | N/A | F/A | N/A |
| Calendar sync | CON (if multi-role or assigned to team(s)) | CON (assigned teams only) | F/A | CON (if enabled) |
| Schedule change notifications | F/A | CON (if enabled and/or assigned teams only) | R/O | R/O |

#### Rosters

| Feature / Story | Admin | Coach | Parent | Athlete |
|-----------------|-------|-------|--------|---------|
| View team rosters | F/A | R/O | R/O | R/O |
| Edit rosters | F/A | CON (if enabled and/or assigned teams only) | N/A | N/A |
| View contact info | F/A | R/O (assigned teams only) | R/O (household only) | N/A |
| Parent/guardian linking | CON (if permission enabled) | N/A | CON (request/edit own) | CON (request/ if enabled) |
| Multi-team athlete support | F/A | CON (if enabled and/or assigned teams only) | CON (multi-roster view, transactions) | R/O (if enabled) |
| Club-wide directory | F/A | N/A | N/A | N/A |

#### Admin Controls & Reporting

| Feature / Story | Admin | Coach | Parent | Athlete |
|-----------------|-------|-------|--------|---------|
| Messaging permission rules | F/A | N/A | N/A | N/A |
| Coach communication guidelines | F/A | R/O (acknowledge) | N/A | N/A |
| Messaging moderation | F/A | CON (team chat only) | N/A | N/A |
| Reporting dashboard | F/A | N/A | N/A | N/A |

### 3.3 User Workflows

Club Web x App User Flows — *(Figma link to be added)*

### 3.4 User Interface (User Journey)

| Role | Club platform | In-app |
|------|---------------|--------|
| **Admin** | Onboarding & set-up; Season creation; Team creation; Invite org/club members; Compose/send announcements; Message templates; Scheduled events; Schedule updates; Team & roster management; User roles & permissions; Org public page (subscribers?) | Compose/send announcements; Message templates; Individual scheduled events; Org public page (subscribers?) |
| **Coach** | Account creation / invite acceptance; Eligibility/compliance tracking & document upload | View/send chats; Create new chats; Schedule view/management (if enabled); Roster management (if enabled); Availability/attendance tracking |
| **Parent/Guardian** | Account creation / invite acceptance; Profile management / permissions | View/send chats; Create new chats?; Schedule view; Roster view; RSVP/availability |
| **Athlete** | Account creation / invite acceptance | View/(participate?) in team chats; Create chats? (if enabled); View schedule; Roster view; RSVP/availability |

### 3.5 User Experience

#### Parent UX Requirements

- **Account & Identity** — Parents can create account without immediate athlete assignment. Athletes linked to one or more parents/guardians and one or more teams. Single login supports multiple athletes, teams, programs. Clear role identification (parent vs athlete vs coach); easy role switching where applicable. *Outcome: No duplicate accounts; no confusion about which role you are using.*
- **Onboarding & First-Time** — Guided onboarding (golden path on web): account creation, athlete linking, notification preferences. Immediate visibility into upcoming events, messages, required actions (registration, payment, forms). Clear empty states when no teams/athletes assigned. *Outcome: Parent understands "what to do next" within first visit.*
- **Communication & Messaging** — Single inbox: Announcements, team chats, direct messages (if in scope). Clear distinction: broadcast announcements vs group chats vs DMs. Role-appropriate permissions; push for time-sensitive messages; message context labeled (team, season, sender role). *Outcome: Parents never miss critical info; messaging feels safe and structured.*
- **Notifications & Reminders** — Control by channel (in-app, email, SMS) and type (messages, schedule, payments). Automatic reminders for practices, games, registration, payments. Notifications deep-link to content. *Outcome: Reduced missed updates; no notification overload.*
- **Scheduling & Calendar** — Unified calendar for all athletes in household and all teams. Event details: date/time, location with map link, team(s), notes/attachments. Visual indicators for schedule changes, cancellations, conflicts. One-click calendar sync. *Outcome: Single source of truth; no manual duplication.*
- **Rosters & Team Context** — Team roster visibility for assigned teams (athlete names, parent/guardian names, optional contact info). Clear team context on every message, event, announcement. Support athletes on multiple teams. *Outcome: Parents understand who's on which team.*
- **Payments, Registration & Required Actions** — Central "To-Do" / "Action Required" surface. Visibility into registration status, payments due/completed, missing docs/waivers, deadlines. Confirmation when actions completed. *Outcome: Parent visibility; fewer admin follow-ups.*
- **Permissions, Privacy & Safety** — Role-based access. Club-configurable: athlete messaging, parent-to-parent, contact visibility. Safeguards for youth communication (default on). *Outcome: Compliance and safety for all users.*
- **Cross-Platform & Accessibility** — Mobile-first (iOS/Android). Full feature parity on web (not in v1). Reliable performance on low-end devices. *Outcome: App works for every family.*

#### Coach UX Requirements

- **Messaging** — Message types: team chat, DMs, coach-only chat. Coach controls team announcements (pinned messages). Attachments? Coach can only message assigned teams; cannot message athletes directly without parent attached. Team chat: auto-created per team during team formation; composer CTA from team page, event page, schedule item. *Keep recipient selection simple. Default notifications on for schedule changes.*
- **Calendar / Schedule** — Events tab (events tied to their teams); link to external or Fastbreak event details. Event cards: event name, location, dates, team(s) attending, team status (roster submitted, waivers, etc.). *NICE TO HAVE: Filters (team, date range, registered vs not), upcoming event reminders.*
- **Event Details** — Event overview: name, dates, location (venue name/address), check-in time?, event contact. Assigned teams and coaches. Roster (event-specific format?). Master event schedule. Calendar sync. *NICE TO HAVE: Hotel block info, links to schedule/stats/rankings, team-specific schedule view, match breakdowns, push for time/court changes.* *Highlight changes since last session?*
- **Teams / Rosters** — Team selector. Team cards: team name, age group, season?, athlete count, coach count. Athletes: name, jersey number, grad year?, attendance status. Athlete profile: emergency contact, medical notes (with permissions). Search/filter athletes. Coaches per team/event with labeled roles (head coach, assistant, manager, volunteer). Contact methods (in-app or email/SMS). Parent list per athlete (read-only). Attendance indicator. Permission-based contact visibility. *Coaches with many teams need fast switching. Offline access for rosters?*
- **NICE TO HAVE: Attendance/Availability** — Statuses: coming, not coming, tentative, no response. Tied to team events. Color-coded statuses, summary counts. Bulk reminders for non-responders. Coaches cannot edit parent responses unless permitted. Alerts for attendance changes.
- **Travel / Hotels** — Hotel block: name, address, booking deadline, link. Indicator if coach/org admin already booked.
- **Cross-Platform** — Permissions & roles: clear distinction between owner, head coach, assistant coach, manager. UI adapts based on permissions.

### 3.6 Non-Functional Requirements

*(To be added)*

---

## 4. Page Examples

Most youth sports club apps have outdated navigation, cluttered UI, and UX not tailored for specific user roles. **TeamSnap** is the most commonly used club app; **Sprocket Sports** and **PlayerFirst** have more user-friendly interfaces.

**Inspo:**

- https://clubvsports.sprocketsports.com/dashboard
- https://leagueapps.com/
- https://my.sportngin.com/user/household
- https://www.playerfirsttech.com/
- https://www.teamsnap.com/
