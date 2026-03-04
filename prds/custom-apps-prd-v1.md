# Custom Apps PRD V1

| Field | Value |
|-------|-------|
| Source | Pasted by user |
| Format | pasted |
| Imported | 2025-03-03 |

---

# Product Requirements Document — Custom Apps

**White-Label Mobile Applications for Sports Organizations**

| Field | Value |
|-------|-------|
| Version | 1.0 |
| Date | January 7, 2026 |
| Document Owner | Garret Mann |
| Status | In progress |

---

## Background

Custom Apps is a white-label mobile application solution that enables sports organizations to provide their participants with a fully-branded app for accessing event information. The solution transforms the event management experience by putting schedules, brackets, team information, and real-time updates directly into the hands of coaches, players, and families.

### Key Value Proposition

- **For Organizations:** Enhance brand presence with a custom-branded app while leveraging proven infrastructure
- **For Participants:** Access comprehensive event information on-the-go with a dedicated, professional mobile experience
- **For Administrators:** Centralized communication channel with push notifications and in-app messaging

---

## 1. Product Overview

### 1.1 Problem Statement

Sports organizations hosting tournaments and leagues need an effective way to:

- Provide real-time event information to participants
- Build and maintain their brand presence
- Communicate updates and changes efficiently
- Reduce administrative burden of answering repetitive questions
- Deliver a modern, mobile-first experience

### 1.2 Solution

Custom Apps provides organizations with fully-branded applications that aggregate all events under their organization into a single, cohesive mobile experience. The apps are built on proven infrastructure while maintaining the organization's unique brand identity.

---

## 2. Target Users

### 2.1 Primary Users

| Role | Need | Goals | Pain Points |
|------|------|-------|-------------|
| **Tournament/League Directors** | Centralized communication and information distribution | Reduce administrative workload, enhance participant experience | Answering repetitive questions, managing last-minute changes, communications |
| **Coaches** | Quick access to schedules, standings, and opponent information | Keep players and parents informed, prepare for games | Juggling multiple information sources, missed updates |
| **Parents/Guardians** | Real-time schedule and location information | Get children to the right place at the right time | Confusion about game times, venue locations, tournament updates |
| **Players** | Access to personal and team schedules | Stay informed about game times and tournament progress | Missing important updates, not knowing standings |

---

## 3. Core Features

### 3.1 Home Screen & Event Discovery

**Requirements:**

- Display organization branding prominently (logo, name, colors)
- List all events under the organization
- Search functionality for finding specific events
- Event filtering by date, location, or sport
- Clear visual hierarchy distinguishing upcoming vs. past events

**User Stories:**

- As a parent, I want to see all upcoming tournaments my organization is hosting so I can plan my schedule
- As a coach, I want to quickly find the specific event I'm participating in without scrolling through irrelevant events

**Acceptance Criteria:**

- Organization logo and branding loads with a predetermined latency on standard mobile connection
- Search returns results quickly
- Events display date range, name, and location
- Tap on event navigates to event details

_Reference: Home screen prominently displays the organization's logo and branding. Events are listed chronologically with dates, names, and locations. Users can search for specific events using the search bar at the top. (Screenshots referenced are via Exposure's product.)_

---

### 3.2 Event Details

**Requirements:**

- Display event logo/branding
- Show event name, dates, and location
- Provide quick access to primary event sections (Schedule, Divisions, Teams, Venues)
- Navigation tabs persist across event pages
- Schedule button prominently displayed
- Favorite/bookmark capability for events

**User Stories:**

- As a user, I want to immediately see the event information and access schedules without unnecessary navigation
- As a tournament director, I want participants to easily access all event information from one central location

**Acceptance Criteria:**

- Event details load quickly
- Navigation tabs remain accessible on all screens within event
- Tapping Schedule button navigates to full schedule view
- Back navigation returns to home screen
- Event logo/banner displays clearly at top of screen

_Reference: Event details page displays the event logo and provides a prominent Schedule button. The bottom navigation bar allows users to quickly access different sections: Home, Divisions, Teams, Venues, and More._

---

### 3.3 Schedule

#### 3.3.1 Schedule View

**Requirements:**

- Display games chronologically with date/time headers
- Show venue/court information for each game
- Display team names and final scores (when available)
- Indicate division/pool information
- Provide search/filter functionality by team or division
- Show game status (scheduled, in-progress, final)
- Enable date-based navigation
- Display tournament day selector (e.g., Day 1, Day 2)
- Show time until next game for favorited teams
- Ability to add to user's calendar (Google / Apple) or RSS feed

**User Stories:**

- As a coach, I want to see all my team's games for the tournament
- As a parent, I want to know when and where my child's next game is
- As a tournament director, I want participants to easily find their games without calling the front desk

**Acceptance Criteria:**

- Schedule loads quickly for tournaments with 1000+ games
- Search returns filtered results quickly
- Date selector shows all tournament dates
- Scores display immediately when updated by administrators
- Tapping a game navigates to game details
- Current/upcoming games highlighted visually

_Reference: Schedule view displays games grouped by date and time, showing team matchups, scores, venues, divisions, and game status (Final). Users can search for specific teams or divisions. The date selector allows navigation between tournament days._

#### 3.3.2 Game Details

**Requirements:**

- Display complete game information (teams, scores, time, location)
- Show division/pool information
- Provide action buttons for Uploads, Directions, and Box Score
- Deep link to maps application for directions
- Display game officials/referees (when available)
- Show court/field number
- Enable sharing game details via text/email
- Ability to add to user's calendar (Google / Apple) or RSS feed

**User Stories:**

- As a parent, I want directions to the venue without manually entering the address
- As a coach, I want to access detailed game statistics when available
- As a player, I want to share my game time with friends and family

**Acceptance Criteria:**

- All game information displays on single screen without scrolling
- Directions button opens native maps application with correct venue address
- Box score opens when game is marked as final (if feature enabled)
- Uploads section displays when content is available
- Share functionality works with device's native share sheet

_Reference: Game details page shows complete information including matchup, score, time, venue, and division. Action buttons provide quick access to uploads, directions to the venue, and box scores._

---

### 3.4 Brackets & Standings

**Requirements:**

- Display tournament brackets in readable format on mobile screens
- Show bracket structure with team names and seeds
- Display game times and locations within bracket
- Show championship, consolation, and placement brackets
- Update in real-time as games are completed
- Enable zooming and panning for complex brackets
- Highlight user's favorited teams in bracket
- Show bracket progression path

**User Stories:**

- As a player, I want to see our path to the championship
- As a parent, I want to know which team we'll face if we win
- As a coach, I want to track other teams' progress in our bracket
- As a tournament director, I want participants to understand the tournament format

**Acceptance Criteria:**

- Brackets load quickly
- Pinch-to-zoom functionality works smoothly
- Updates appear live quickly
- Brackets remain readable at default zoom level
- Tapping a game in bracket shows game details
- Bracket supports both single and double elimination formats

_Reference: Bracket view displays the tournament structure with team matchups, showing results and progression through semifinals to the championship._

---

### 3.5 Team

#### 3.5.1 Team Directory

**Requirements:**

- List all teams organized by division
- Display team names with optional organization affiliation
- Enable search functionality for team names
- Show team count per division
- Provide navigation to individual team pages
- Display team logos/photos when available
- Sort teams alphabetically within divisions

**User Stories:**

- As a coach, I want to look up information about our next opponent
- As a player, I want to see which other teams are in our division
- As a parent, I want to find my child's team quickly

**Acceptance Criteria:**

- Teams load quickly
- Search filters results in real-time as user types
- Division headers clearly separate team groups
- Tapping team navigates to team detail page
- Team count displays accurately for each division

_Reference: Teams page organizes all participating teams by division (e.g., GU10 Novice, GU11 Atoms), making it easy to browse and find specific teams._

#### 3.5.2 Team Rosters

**Requirements:**

- Display complete roster with player names and jersey numbers
- Sort players by jersey number or alphabetically
- Enable navigation to individual player profiles (when available)
- Show team affiliation and division at top of page
- Display coach names and contact info (when available)
- Show player photos when available
- Indicate team captains or key players

**User Stories:**

- As a parent, I want to confirm my child's jersey number
- As a coach, I want to review our roster before the game
- As an opponent coach, I want to scout the other team's players

**Acceptance Criteria:**

- Roster loads quickly
- Players display in jersey number order by default
- Tapping player navigates to player detail (if available)
- All player information displays clearly and is readable

_Reference: Roster page displays all players on a team with their jersey numbers._

#### 3.5.3 Player Profiles

**Requirements:**

- Display player name and jersey number prominently
- Show player photo or placeholder icon
- Include team affiliation
- Provide space for additional player information (position, height, grade, etc.)
- Display player statistics when available
- Link to player's individual game history

**User Stories:**

- As a player, I want to see my profile information
- As a parent, I want to view my child's player card
- As a coach, I want to access player stats and history

**Acceptance Criteria:**

- Profile loads quickly
- Placeholder displays when no photo uploaded
- Jersey number displays prominently
- All available player information displays in organized format

_Reference: Individual player profiles display the player's name, jersey number, and team affiliation._

---

### 3.6 Venue Information

#### 3.6.1 Venue Directory

**Requirements:**

- List all tournament venues
- Display venue names clearly
- Enable navigation to individual venue details
- Show venue count
- Group venues by region/area when applicable
- Display distance from user's location (when location permission granted)

**User Stories:**

- As a parent, I want to find the venue where my child is playing
- As a coach, I want to review all venues used in the tournament
- As a tournament director, I want participants to easily find venue information

**Acceptance Criteria:**

- Venues load quickly
- Tapping venue navigates to venue detail page
- Venue list displays in logical order (alphabetical or by distance)

_Reference: Venues page lists all locations used for the tournament._

#### 3.6.2 Venue Details

**Requirements:**

- Display venue name and specific court/field information
- Show complete address with city, state, and ZIP
- Provide two primary action buttons: Schedule and Directions
- Deep link to native maps application (Apple Maps on iOS, Google Maps on Android)
- Display venue phone number (when available)
- Show parking information and instructions
- Display venue photo/image when available
- Show list of upcoming games at this venue

**User Stories:**

- As a parent, I want driving directions without typing the address
- As a coach, I want to see what other games are happening at our venue
- As a player, I want to know where to park at the venue

**Acceptance Criteria:**

- Address displays in readable format
- Directions button opens native maps app (Apple Maps on iOS, Google Maps on Android)
- Maps app pre-populates with correct address and venue name
- Schedule button shows filtered schedule for that venue only
- Phone number is tappable and initiates call

_Reference: Venue detail page shows the complete address and provides buttons to view the schedule for that venue or get directions via the device's native maps application._

---

### 3.7 Notifications & Messaging

#### 3.7.1 Push Notifications

**Requirements:**

- Enable/disable push notifications globally
- Support text (SMS) notifications with phone number entry
- Support email notifications with email address entry
- Allow user selection of mobile carrier for SMS
- Provide save functionality for notification preferences
- Support "Following" specific events, teams, or divisions
- Send notifications for: game time changes, score updates, bracket updates, tournament announcements
- Allow granular control over notification types

**User Stories:**

- As a parent, I want to receive text alerts when game times change
- As a coach, I want email notifications for important tournament updates
- As a tournament director, I want to send urgent updates to all participants
- As a player, I want to follow only my team and receive updates about our games

**Acceptance Criteria:**

- Notification preferences save quickly
- Push notifications deliver quickly after being sent
- SMS messages deliver within 2 minutes
- Email notifications deliver within 5 minutes
- Users can enable/disable each notification type independently
- Following feature allows selective notifications by team/division

_Reference: Notifications settings page allows users to configure their notification preferences, including push notifications, text messages (with phone number and carrier selection), and email notifications._

#### 3.7.2 In-App Messaging

**Requirements:**

- Display messages from tournament organizers
- Show message title, timestamp, and sender
- Format message content with proper line breaks and spacing
- Support links within messages
- Enable message categories (announcements, updates, alerts)
- Provide message history/archive
- Show unread message count badge
- Support rich text formatting in messages

**User Stories:**

- As a tournament director, I want to send welcome messages and important information to all participants
- As a coach, I want to read detailed tournament information and share it with my team
- As a parent, I want to see all messages from the tournament organizer in one place
- As a player, I want to know when there are new important messages

**Acceptance Criteria:**

- Messages load quickly
- Message formatting preserves line breaks and spacing
- Links are tappable and open in appropriate browser/app
- Back navigation returns to messages list
- Unread badge displays accurate count
- Messages display in reverse chronological order (newest first)

_Reference: In-app messages allow tournament organizers to communicate important information to all participants (e.g., welcome message with event details, dates, venue information, and divisions)._
