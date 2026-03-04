# Release 2 (Albums & Filtering)

| Field | Value |
|-------|-------|
| Source | https://fastbreak.atlassian.net/wiki/spaces/ASPAD/pages/707526659 |
| Format | confluence |
| Imported | 2025-03-03 |

---

| **Swoop Release Cycle** |
|---|
| **Stages 1** | **Stage 2** | **Stage 3** |
| **Part 1**Dev, Docs & Flow"Approval&rdquo; | **Part 3**Code Freeze | **Part 6**Staging to Prod |
| **Part 2**Dev | **Part 4**Testing in Dev | **Part 7**Release |
| &nbsp; | **Part 5**Dev to Staging | Finalizing Scope |
| **Scoping Next Release** |

**Concept Overview &mdash; "Albums & Folders = One System&rdquo; (P0)**

We're building a photo management system that feels like Google Drive on the backend (for admins and contractors) and like Apple Photos or Google Photos on the frontend (for users in the mobile app).

Everything centers around a clear folder taxonomy that keeps media organized, searchable, and access-controlled.

**Mobile App (User Side) **

Think of the **event** as the "parent folder,&rdquo; but users don't see it as a folder &mdash; they just see and search for their event.

Once they open the event:

- They see albums (which correspond to subfolders in the portal).
- They can search and filter albums/photos by:

- 
**Date(s)**

**Multi-day events** will show multiple date filters.
- **Single Day Events** will hide this filter
- **Venue(s)**
- **Photographer(s)**
- Users can **filter photos further** using:

- 
**Facial AI** (find photos of themselves)
- **Label detection** (team name (NEW), jersey number, athlete name)
- They can **purchase**:

- 
Single photos or multi-photos
- The full album (flat price) &larr; Price $99.99 (P1)

Or "All-Access&rdquo; facial unlocks (based on permissions)

**Portal (Admin + Contractor Side)**

### Structure = Folder Hierarchy (Taxonomy)

We're mimicking Google Drive

- **Event Folder which is just creating the event and attaching albums to it (Top Level) (P0)**
- Represents the entire event.
- This "parent folder&rdquo; = the "event&rdquo; users see in mobile.
- **Date Folder (Second Level) (P0)**
- One folder per event day tied to a date tag in the db.
- Automatically created based on event start and end dates.
- Used for filtering by date in the app.
- **Album Folder (Third Level) (P0)**
- Each folder is a specific game, matchup, or theme.
Example: `Team A vs Team B - 12U - 12:30PM - Rink 1`
- This is what shows up as an "Album&rdquo; in mobile with the title we give the folder.

- 
Album title user sees is the folder title given in the portal.
- **Tabs in mobile =  Subfolders (P1)**
- Inside an album, we can have optional subfolders (tabs in the mobile view):

- 
`All Photos`--> always the case.
- `Action --> can have the same media id in all photos`
- `Medal` `--> can have the same media id in all photos`
- `Team` `--> can have the same media id in all photo`
- Contractors drag-and-drop into these folders as assigned on site and in portal.

**Access & Permissions (P0)**

This is key.

We'll define who can **view**, **upload**, **edit**, or **delete** at each folder level:

- **Admins:** Full access (can manage folders, uploads, permissions, delete, approve, deny) same as v1
- **Contractors:** Limited to their assigned folders
(they can upload and manage only what they're assigned/given access to do)
- UI to track who uploads what and where

- 
Contractor 1 uploaded  X amount of media to Y "Folder/Album&rdquo;
Example:
Photographer 1 is assigned to "Rink 1 – 12U Wild v Yeti&rdquo;
They can upload into that folder but can't touch any other folders.

This prevents cross-upload mistakes and keeps content separated by job.

### Role Views

| Role | View | Description |
|---|---|---|
| **Admin** | File Management Dashboard | Full folder tree view, drag/drop, access management, photo moderation |
| **Contractor** | Assigned Folders Only | Simplified upload interface showing only their jobs; drag/drop upload |
| **Mobile User** | Event &rarr; Albums &rarr; Photos &rarr; Buy | Clean browsing and filtering experience; no folders visible, just album cards and filters |

### Key Relationships

| Portal Layer | Mobile App Equivalent | Notes |
|---|---|---|
| Event Folder (Parent Layer) | Event | This is **not shown as a folder in the UI**, but conceptually it's the "top-level container&rdquo; that everything else sits under..Created by Admin; basis for search and event display |
| Date Folder | Date Filter | Automatically generated from event start/end dates |
| Album Folder | Album Card | Shown in mobile event view with title, cover photo, and metadata |
| Subfolder | Tab in Album | Allows organization by photo type (Action, Team, etc.) |
| Permissions | Upload/Access Rules | Determines what contractors can view or modify |

**Summary**

- **Portal = File Manager** &rarr; Like Google Drive with roles and folders.
- **Mobile = Photo Browser** &rarr; Simplified, user-friendly, filterable view of the same structure.
- **Linkage**: Every folder in the portal maps directly to an element in the app:

- 
Event = Event
- Venue = Venues
- Photographer = Photographer filter id
- Date Folder = Date Filter id
- Album Folder = Album Card
- Subfolder = Tab inside album
- Access = Photographer id
- **Permissions:** Access is controlled per folder/job to prevent mix-ups.

## Concept Overview – CSV Importer for Album Names (P3)

The CSV Importer allows admins to bulk-create multiple album folders inside a single day album event folder with one upload. Instead of manually adding each album and naming it individually, users can prepare a simple CSV file containing all album names under one column labeled `Album_name`.

Each row in the CSV represents a separate album. For example:  
wide760Album_name
10:00 AM | Rink 1 | Tampa Bay Lightning vs Carolina Jr Canes | 12U
12:15 PM | Rink 2 | Florida Alliance vs Nashville Flyers | 14U
2:30 PM | Rink 1 | Miami Toros vs Atlanta Fire | 16U
etc
When uploaded through the "Import CSV&rdquo; button in the portal, the system automatically generates a matching folder for each listed album.

This feature streamlines the setup process for high-volume events&mdash;letting organizers quickly create dozens of properly labeled game albums directly from a spreadsheet, saving significant time and reducing human error.

## Concept Overview – Pricing (P1)

| **Level** | **What's Sold** | **How It's Priced** | **How It's Managed** |
|---|---|---|---|
| **Album** | **A single album** | **Dynamically (default then can be changed)** | DB |

## Concept Overview "Filtering & Searching&rdquo; - Mobile and Portal Parity (P0)

- We need indicators for what content is pending. 
- They can search and filter albums/photos by:

- 
**Date(s)**

**Multi-day events** will show multiple date filters.
- **Single Day Events** will hide this filter
- **Venue(s)**
- **Photographer(s)**
- Users can **filter photos further** using:

- 
**Facial AI** (find photos of themselves)
- **Label detection** (team name (NEW), jersey number, athlete name)

**Concept Overview – Download Button Feature (P0)**

The **Download Button** lets users quickly download **all photos and videos in an album or folder** at their **original, full-resolution quality**.

### How It Works

- A **"Download All&rdquo;** button appears inside each album or folder in the portal.
- When clicked, it automatically packages every file in that album into a single ZIP file.
- The ZIP keeps any subfolders (like "Action&rdquo; or "Team&rdquo;) in place and preserves original file quality.
- A secure download link is generated that expires after 24 hours.
### Access Control

- **Admins:** Can download from any album or folder.
- **Contractors:** Can only download from folders they are assigned to.
- **Mobile Users:** Can download full albums only after purchase or if given permission.
### Why It Matters

It provides a fast, simple way to get all original files from an album without compression or third-party tools
