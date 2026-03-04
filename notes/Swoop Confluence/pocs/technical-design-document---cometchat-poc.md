# Technical Design Document - CometChat PoC

| Field | Value |
|-------|-------|
| Source | https://fastbreak.atlassian.net/wiki/spaces/ASPAD/pages/1026162691 |
| Format | confluence |
| Imported | 2025-03-03 |

---

## 1. Overview

The purpose of this document is to outline the lessons learned from the CometChat Messaging PoC. This document will be used to inform stakeholders of what we've learned about CometChat, and to highlight any outstanding issues.&nbsp;

## 2. User Authentication

### 2.1 Example Login Flow

- User logs into application (client side)
- Request hits application backend
- User authenticated via Universal Login
- Does this user have a CometChat UID?
- If no &rarr; create one (`POST /users`), assign role (`PUT /users/{uid}`), issue token (`POST /users/{uid}/auth_tokens`), create `device_sessions` record &rarr; skip to step 7

- 
How do we know which role to assign at this point?
- If yes &rarr; proceed to step 5
- Validate device fingerprint/token

- 
If unrecognized &rarr; **check role:** 

**Athlete (or any minor role)** &rarr; hard stop. Force re-authentication (e.g., require parent/guardian verification or a secondary confirmation step before proceeding). Do not issue a token until verified. Log the attempt.
- **Coach / Parent / Admin** &rarr; softer handling. Create a new `device_sessions` record, issue a new token (`POST /users/{uid}/auth_tokens`), but flag the login and notify the user (e.g., &quot;New device detected&quot; email/push). Proceed to step 8.
- If recognized &rarr; proceed to step 6
- Is the token older than X days?
- If no &rarr; return existing token from `device_sessions`, no CometChat API calls made
- If yes &rarr; delete old token (`DELETE /users/{uid}/auth_tokens/{token}`), issue new token (`POST /users/{uid}/auth_tokens`), update `device_sessions`
- Return UID and token to client
- Client initializes SDK
### 2.2 Example Logout Flow

- User initiates logout (client side)
- Client sends logout request to backend with:

- 
App session credentials
- Device fingerprint
- Backend validates the app session
- Look up the `device_sessions` record for this user + device fingerprint
- Delete the CometChat auth token (`DELETE /users/{uid}/auth_tokens/{token}`)

- 
Still sign the user out, even if this fails.
- Delete or invalidate the `device_sessions` record for this device
- Clear the user's app session (existing flow)
- Return success to client
- Client calls SDK logout, clears any locally stored UID/token

*Should still consider: When is the best time to create and authenticate CometChat users?*

## 3. User Roles & Permissions

### 3.1 CometChat Role Model

CometChat supports two levels of roles: Group Scoped Roles (limited to `Participant`, `Moderator`, and `Admin`) and Global User Roles (custom roles assigned at the user level). We should use Global User Roles to accommodate the application's multi-role, multi-context requirements. Examples of these roles include coach, athlete, and parent.

### 3.2 Multi-Role User Handling

A CometChat User ID can only be tied to one Role ID at a time. Users who hold multiple roles across different contexts will require multiple User IDs &mdash; one per role context.

Example:

A user who coaches the U17 team and is a parent on the U14 team would have `user_123_coach` (Role: `coach`, U17 group) and `user_123_parent` (Role: `parent`, U14 group).

### 3.3 Permission Validation

CometChat does not natively enforce granular role-based messaging permissions. Permission enforcement will need to be implemented in our backend. 

Goal: By the time a request reaches the CometChat API, our backend has already verified that the requesting user is allowed to perform it.

Example Flow:

- Client makes a request to complete an action
- Backend authenticates the app session
- Resolve the CometChat UID for the current session
- Look up the role associated with that UID 
- If role is not what we expect, return a 403
- If role has permission to complete this action, complete the intended action
## 4. User CRUD Actions

### 4.1 Database Tables

These are tables we would set up to keep our own record of user data stored in CometChat

- Users Table - Includes a foreign key to our Supabase UUID, the CometChat User ID, the users role, their group ID, etc.
- Device Sessions Table - Includes device token, when it was issued, the user it's tied to, etc.
### 4.2 Potential Endpoints

These are the endpoints our API would need:

- POST /messaging/users
- GET, PUT, DELETE /messaging/users
- POST, DELETE /messaging/auth/token
## 5. Group CRUD Actions

### 5.1 Database Tables

These are tables we would set up to keep our own record of group data stored in CometChat

- Groups Table - Includes the CometChat GUID, group name, group type?, etc.
### 5.2 Potential Endpoints

These are the endpoints our API would need:

- POST /messaging/groups
- GET, POST, PUT, DELETE messaging/groups/{guid}
### 5.3 Group Flow

Keeping 

*Outstanding: What triggers group creation, user assignment to a group, removing users from groups, etc.?*

## 6. Group/Role Based User Experience

While CometChat doesn't offer a native solution for this, we can use group IDs and roles to our advantage.

### 6.1 Group ID as Workflow Scope

Each user's experience can be scoped to the Group IDs they are a member of. All UI surfaces &mdash; conversation lists, chat creation, announcements &mdash; would be filtered accordingly. The CometChat SDK handles this automatically by surfacing only groups the logged-in user belongs to.

### 6.2 User Role as Workflow Scope

Each user's experience can be scoped to their role in addition to their group membership. Actions a user doesn't have permission to perform should be invisible to them entirely. Our backend is what enforces this, but the UI will mirror these rules.

Examples:

- When an athlete opens the "New Direct Message&rdquo; flow, other athletes are excluded from the recipient list.
- In the UI, the "Send an Announcement&rdquo; feature only appears to users with the "coach&rdquo; role.
## 7. Push Notifications

**CometChat doesn't have a native OneSignal integration.** Their push notification system is built around FCM (Firebase Cloud Messaging) and APNs directly.

This means we'll need to either&hellip;

a) Use FCM 

b)  Bypass CometChat's push system and use OneSignal via webhooks

c) Handle notifications ourselves. This would involve handling token management, android support (with a separate FCM implementation), retry logic, and any analytics

## 8. Moderation

### 8.1 Built-in Filters

CometChat provides pattern-based filtering for Profanity, Contact Details, and Email &mdash; straightforward to enable via the dashboard.

### 8.2 AI-Powered Moderation (OpenAI Extension)

This feature requires further testing before inclusion in the production implementation.

- Need to validate what data is transmitted to OpenAI
Outstanding: Who has the ability to "moderate&rdquo;? Do admins have permissions?

## 9. Remaining Questions

- Will this need it's own DB schema? Which Postgres role will we use for this?
- Chat history for admins?
- Scheduled messages?
- sending files? images?
- can you @ someone?
- messaging across groups

- 
example: a group of all coaches
- test this concept: if an athlete wants to create a chat with another athlete, the associated parent(s) should automatically be added to that chat
- See if you can test with FCM
