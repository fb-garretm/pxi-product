# Messaging Related User Flows for V1

| Field | Value |
|-------|-------|
| Source | Pasted by user |
| Format | pasted |
| Imported | 2025-03-03 |
| Date | Apr 1, 2026 |

**Context:** Swoop x Club — user flows for messaging and communication by role.

---

## Admin User Flows

### Communication Management

**Flow:**

1. Select audience — Entire club, team(s), coaches, parents
2. Select message type — Announcement, chat, alert
3. Compose message — Text, attachments, links
4. Set delivery options *(more relevant on web platform)* — Push, email, SMS (if enabled)
5. Send immediately or schedule
6. View delivery (open/unread visibility?)
7. Moderate or delete messages if needed *(allow for users to edit messages after they are sent?)*

**Admin controls:**

- Who can message whom
- Read-only announcements

---

### Permissions & Role Management

**Flow:**

1. View users by role
2. Assign or change role — Admin, coach, parent/guardian, player
3. Set role-based permissions
4. Remove or suspend users
5. Audit activity (message logs, edits)

**Important:** Youth safety compliance — limited direct messaging to minors.

---

### Compliance & Safety Oversight

**Flow:**

1. Review communication logs
2. Flag or investigate messages
3. Manage consent forms (if integrated)
4. Control media sharing permissions
5. Handle user reports or violations

---

### Season Wrap-Up / Offboarding

**Flow:**

1. Lock messaging
2. Archive teams and chats
3. Export records if needed
4. Roll over to new season

---

## Coaches User Flows

### Coach Onboarding / Team Access

**Flow:**

1. Accept team invite OR create a new team (depending on permissions)
2. Verify role (Head Coach, assistant coach, team rep)
3. Complete profile (name, contact info, certifications?)
   - *Certifications will be tracked on the web platform — would be nice for coaches to see eligibility status*
4. Land on team dashboard

**Key considerations:**

- Role-based permissions set from admin
- Access to roster, schedule, messaging enabled

---

### Team Communication

**Flow:**

1. Open Messages
2. Choose recipients:
   - Entire team
   - Parents only
   - Coaches only
   - Individual (direct)
3. Send message (push + email)
4. View message delivery/read status?

---

## Parents Flows

### Account Creation & Joining a Team

**Goal:** Get the parent into the correct team with minimal friction.

**Flow:**

1. Receive invite link
2. Create account / log in
3. Accept team invite
4. Assign child to team — allow for multi-athlete selection (parent may have multiple athletes on different teams)
5. Set parent/guardian role
6. Notification preferences setup

---

### Team & Child Dashboard

**Goal:** Snapshot of athlete roster / schedule / team chat.

**Flow:**

1. View child profile(s)
2. See upcoming events (practices, games)
3. View recent messages / alerts
4. Check attendance status
5. See team announcements

---

### Messaging & Communication

**Goal:** Stay informed and ask questions.

**Flow:**

1. Receive team-wide messages
2. Read coach announcements
3. Reply
4. Direct message coach (or other parents?)
5. View message history

---

### Notifications & Preferences

**Goal:** Control what parents receive without missing essentials.

**Flow:**

1. Choose notification types: Schedule changes, Messages, Payments?
2. Set per-child or per-team preferences
3. Email vs push vs SMS?

---

## Athletes Flows

### Athlete Onboarding & Account Access

**Goal:** Get the athlete into the team dashboard.

**Flow:**

1. Athlete receives invite (email invite or parent adds athlete?)
2. Athlete creates or accesses an account (potentially through a household account?)
3. Athlete selects team
4. Athlete lands on team dashboard

**Considerations:**

- Younger athletes often don't control the account
- Older athletes (13+) may manage login themselves
- Permissions should be limited

---

### Team Dashboard

**Goal:** See team overview (roster / schedule / team chat).

**Flow:**

1. Athlete opens app
2. Lands on Team Dashboard
3. Views: Upcoming events, Recent messages, Availability requests, Announcements

---

### Team Messaging

**Goal:** Communicate with team and coaches.

**Flow:**

1. Athlete opens Messages
2. Views: Team-wide chats, Coach-only messages? *(Age permissions)*
3. Opens message thread
4. Reads or responds (if permitted)
