# (V1) CometChat Messaging PoC Notes

| Field | Value |
|-------|-------|
| Source | https://fastbreak.atlassian.net/wiki/spaces/ASPAD/pages/981139462 |
| Format | confluence |
| Imported | 2025-03-03 |

---

## Auth and Security

### Authentication

- Mobile App Client &rarr; API (with session token)
- API &rarr; Validates session (via our new RLS based API Handlers ) 
- API uses [context.user.id](http://context.user.id) as the CometChat UID, which will be used to generate auth token
- API &rarr; CometChat REST API &rarr; Returns CometChat Auth JWT token to Mobile App Client
### Device Tokens

- Store these in our DB - used to check if the device is known. If not, store a new token with the current auth tokens
- If device is known, we retrieve the stored Auth token for this device
### Are We Exposing Tokens?

- If we use the SDK, Auth token is sent back to the client.

- 
Expires by default, but we can implement further token refresh logic
- CometChat SDK components need direct WebSocket connections to CometChat servers

- 
For real time messaging, conversation lists, typing indicators, online presence, push notifications, offline message sync
- The token is&nbsp;sent over an encrypted TLS connection. However the token itself is not encrypted (plain text)
- So, we would need to encrypt the auth token ourselves, perhaps through a package like expo-secure-store

- 
Encrypted&nbsp;storage (iOS Keychain, Android Keystore)
- Handles encryption/decryption automatically
- Optional biometric protection
- No manual encryption needed
- So the token would be encrypted during network transmission and storage. 
- Technically exists in plain text in Javascript memory at runtime, but this is &quot;unavoidable&quot;
- So overall, an attacker would need to compromise the physical device. 
### The SDK Alternative

To avoid this, we'd have to abandon the CometChat SDK and build the functionality ourselves

- This includes handling real-time features
- Minimum viable real-time chat:

- 
WebSocket Server (Handle connections, Broadcast messages, Manage presence)
- Database Schema (Messages, Conversations, Users)
- API Endpoints (Send message, Get history, Create conversation)
- Client SDK (WebSocket client, Reconnection logic, Message queue (offline))
- Push Notifications (FCM/APNs setup, Notification payloads)
- Media Handling (Upload/download, Storage)
## SDK: Features

### Component Customization

**What you can customize:**

- Global and component level theming (Colors, Typography, Spacing, Radius, Shadows)
- Can build custom internal components for the larger CometChat Components

- 
Ex: Custom Message Bubble in the CometChatMessageList
**Can't Easily Customize:**

- Component structure/layout
- Internal Component Logic
- Deep-nested elements
**Components I used to power the POC:**
<CometChatConversations />

- Conversation List: Shows all conversations with unread counts
<CometChatMessageHeader/>
- Chat Header: Shows&nbsp;user/group name, back&nbsp;button, actions
<CometChatMessageList /> 
- Message List: Displays sent/received messages with real-time updates
<CometChatMessageComposer />
- Message Input: input field, send button, attachments
<CometChatUsers />
- User List: Shows users for starting&nbsp;new chats
## Permissioning

### In the Dashboard, we can set...

- User roles&nbsp;&mdash; Create and manage&nbsp;roles with permissions:

- 
listUsers: Control who users&nbsp;can see (all&nbsp;or&nbsp;friendsOnly)
- sendMessagesTo: Control who users can message&nbsp;(all&nbsp;or&nbsp;friendsOnly)
- Assign&nbsp;roles to users
- Group&nbsp;member scopes&nbsp;&mdash; Change member scopes via REST API:

- 
Assign users as&nbsp;ADMIN,&nbsp;MODERATOR, or&nbsp;PARTICIPANT
- Done via API calls (can be automated/scripted)
### But the following would have to be controlled by us/on the app level

- UI behavior&nbsp;&mdash; Hiding/showing the message composer based on permissions:

- 
Dashboard roles don't automatically hide UI components
- You need to check permissions in code and conditionally render components
- Custom announcement logic&nbsp;&mdash; Restricting replies to announcements:

- 
Not a built-in dashboard feature
- Requires custom message types and conditional composer rendering
- Group-specific&nbsp;rules&nbsp;&mdash; Like "only admins can send in this group&rdquo;:

- 
Dashboard doesn't have per-group composer rules
- Implement by checking member scope in code

Jan 29 Feedback

- Can we limit which users are displayed/can be messaged?
- Can we limit the users that can be &quot;searched for&quot;?
- Can we tie users to group ids, so that they can only see certain information

- 
The ability to messages by &quot;Group&quot;?
- Household - Grouping users to &quot;something&quot; - to a club/team/roster/even household?
- How are we handling Push Notifications?
- Find out more information about "roles&rdquo; and what they enable
- Look into gating users & moderation

- 
Demonstrate a user that can only message in a particular channel
- Find out what they're passing to OpenAI during moderation
