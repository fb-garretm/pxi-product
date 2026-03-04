# Messaging Feature Requirements for V1

| Field | Value |
|-------|-------|
| Source | Pasted by user |
| Format | pasted |
| Imported | 2025-03-03 |

---

## 1. Functional Requirements

### 1.1 Announcement Broadcasting (Club → Groups)

**Requirements**

- Club admins can send announcements to:
  - Entire club
  - Individual teams
- Announcement supports:
  - Title + plain text body
- Delivery channels:
  - In-app notification (default)
  - Push notification

**UX Notes**

- Announcements appear in a dedicated "Announcements" feed (not mixed with chat) for all users

---

### 1.2 Coach-to-Team Messaging

**Requirements**

- Coaches can only message their assigned team(s)
- Messages support:
  - Text
- Messages delivered via:
  - In-app
  - Push
- Coaches cannot message outside their assigned teams

**UX Notes**

- Coach messages visually labeled as "Coach"

---

### 1.3 Push Delivery & Notifications

**Requirements**

- Notification types:
  - Announcements
  - Messages
- User-level notification preferences:
  - In-app only
  - Push (configurable)
- Automatic push notifications triggered by:
  - New announcements (for all new messages would likely get annoying fast)

---

### 1.4 Group Messaging (Team Chat)

**Requirements**

- Whole-team chat available by default once athletes/coaches are assigned to rosters on web

**UX Notes**

- Clear participant list (includes coaches, athletes, and adults from household)
- Athlete accounts visually distinguished from parents/coaches

---

## 2. Roles

### 2.1 Coach Messaging Permissions

**Requirements**

- **Coaches can:**
  - Message whole team
  - Send team announcements
- **Coaches cannot:**
  - Access other teams

---

### 2.2 Parent/Guardian Linking

**Requirements**

- Athletes can be linked to:
  - Multiple parents/guardians
- Each guardian has:
  - Independent login
  - Independent notification preferences

---

### 2.3 Multi-Team Athlete Support

**Requirements**

- Single athlete can belong to:
  - Multiple teams (e.g., practice squad + travel team)
- Messages and notifications aggregate across teams
- Clear team context shown on every message
