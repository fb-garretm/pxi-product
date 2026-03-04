# Swoop<> Club/Compete Brief

| Field | Value |
|-------|-------|
| Source | https://fastbreak.atlassian.net/wiki/spaces/ASPAD/pages/834043910 |
| Format | confluence |
| Imported | 2025-03-03 |

---

## as of

## Compete &times; Swoop – Messaging Feature

### ⚠️ Mobile-First Disclaimer (Read First)

This feature is mobile-first by design. Push notifications and the ability for users to communicate on the go without opening a web browser are critical requirements. Messaging must run within a natively deployed iOS and Android application (either a shell or full native app).

- Push notifications are required, not optional.
- Web-**ONLY** &larr; experiences are insufficient for this use case
- Messaging is expected to be consumed in real time, similar to SMS or WhatsApp
All system, role, and messaging decisions should assume a native mobile context first, with web considered secondary.

## Context

This initiative is to deliver in-app, text-based messaging for clubs (TeamSnap like / WhatsApp, Messenger or Discord/Slack-style). [Teamsnap](https://www.teamsnap.com/) already provides this capability, which is driving us to actively evaluate and pressure-test similar workflows. We are pursuing a club pass with TeamStatus Friday so we can use the product directly, understand the UX and permission model, and inform our MVP approach.

The initial target is a V1-level messaging experience: text-to-text, role-based messaging and announcements (one-to-one and group), with messaging behavior governed by user roles.

To support this, we will need to introduce explicit role and profile enforcement in the application so that messaging behavior aligns with club hierarchy and expectations.

Messaging itself is not currently tied to club contracts, but the goal is to ship an MVP in March, with Club production readiness targeted for May. This work is not standalone &mdash; it surfaces foundational gaps in roles, permissions, and rostering that must be addressed for messaging to function correctly and safely.

From a compliance perspective, this feature involves minors and requires legal review. A meeting with Legal is scheduled for Monday, where Emily (PM for Club, and feature champion) will lead discussion around role-based permissions, messaging boundaries, and compliance requirements. Emily will also be added to ongoing stand-ups to support cross-team execution.

**Club Taxonomy & Core Entities**

| Entity | Description | Hierarchy Level | Key Responsibilities / Notes |
|---|---|---|---|
| **Club Admin** | User who runs a club | Top | Manages club, teams, and staff; synonymous with **Club Admin** for MVP |
| **Club** | Group of one or more teams | Container | Permissions and messaging scope roll up at club level |
| **Team** | Team within a club | Child of Club | Primary unit for rostering, team messaging, and coach/parent scope |

## Roles & Relationships

| Role | Team Association | Can Belong to Multiple Teams | Messaging Scope | Notes |
|---|---|---|---|---|
| **Coach** | Assigned to one or more teams | Yes | Teams they are assigned to | Can coach multiple teams within the same club |
| **Assistant Coach** | Assigned to one or more teams | Yes | Teams they are assigned to (reduced permissions) | Permission differences TBD, but scoped by team |
| **Parent** | Linked via athletes | Yes | Team(s) their athlete(s) belong to | Messaging governed by role + team context |
| **Athlete** | Rostered to teams | Yes | Likely read-only or restricted | Always linked to at least one parent/guardian (pending Legal) |

## Key Structural Rules (Reference)

| Rule | Description |
|---|---|
| Contextual Roles | A user's permissions depend on the club/team context, not globally |
| Multi-Role Users | One user may hold multiple roles across teams (e.g., Coach on Team A, Parent on Team B) |
| Messaging Scope | Derived from Club &rarr; Team &rarr; Role Assignment |
| Profile vs Role | Profile type alone is insufficient; role + assignment drives behavior |

**Out of Scope for V1**

- Media (photos, videos, files)
- Emoji reactions, read receipts, typing indicators
- Coach &harr; Coach Messaging?
- Parent &harr; Parent messaging?
- Athlete &harr; Athlete messaging?
- Athlete-initiated conversations (pending Legal)
- Message search, pinning, forwarding
- Edit history
- admins see all messages?
- Is there message logging?
- Can Legal request transcripts?
- Is anything ephemeral?

**V1 Success Looks Like**

- Club Admin can broadcast announcements
- Coaches can reliably message assigned teams
- Parents receive push notifications in real time
- Zero unsafe messaging paths involving minors

## POSSIBLE SERVICES:

## Messaging & Notification Services – Comparison Matrix

| Service | What It Is | What It's Good At | What It's **Not** | When We'd Use It |
|---|---|---|---|---|
| Upstash[https://upstash.com/](https://upstash.com/) |  |  |  |  |
| **Stream**** (**[http://getstream.io](http://getstream.io) **)** | Fully managed chat + activity feed platform | Real-time chat threads &bull; Group messaging &bull; Mobile SDKs (iOS / Android) &bull; Scales well &bull; Built-in logging/moderation | Not cheap at scale &bull; Still requires our own role & permission enforcement &bull; Vendor dependency | If we want to **move fast on chat** and offload real-time infra |
| **Pusher**[https://pusher.com/](https://pusher.com/) | Real-time messaging infrastructure (pub/sub) | Lightweight real-time delivery &bull; Good control over architecture &bull; Less opinionated | No threads &bull; No persistence &bull; We build group logic, permissions, storage | If we want **full control** and are okay building messaging logic ourselves |
| **OneSignal**[https://onesignal.com/](https://onesignal.com/) | Push notification & segmentation service | Push notifications &bull; Strong targeting (roles, segments) &bull; Admin dashboard | Not a chat system &bull; No threads or conversations &bull; No message storage | To **notify users** about messages, announcements, alerts |

## How These Fit Together (Likely Architecture)

- **Stream OR Pusher** &rarr; handles *real-time message delivery*
- **Our backend** &rarr; enforces roles, permissions, roster rules
- **OneSignal** &rarr; sends push notifications for:

- 
New messages
- Announcements
- Important alerts
- **Stream** = faster implementation, higher cost, less control
- **Pusher** = more engineering work, more control, lower abstraction
- **OneSignal** = required for push notifications regardless
