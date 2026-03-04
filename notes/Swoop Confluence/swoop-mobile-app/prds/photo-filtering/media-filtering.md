# Media Filtering

| Field | Value |
|-------|-------|
| Source | https://fastbreak.atlassian.net/wiki/spaces/ASPAD/pages/679968782 |
| Format | confluence |
| Imported | 2025-03-03 |

---

## Overview

The Media Filtering and Albums feature enhances the media management module by introducing advanced filtering capabilities for event photos and videos. This allows users (attendees, organizers, photographers) to efficiently browse and locate specific media from large collections, such as those from multi-day sports tournaments. The feature is inspired by user feedback for better organization and searchability in high-volume media uploads, similar to the basketball event gallery interface.

### Business Requirements

- **Albums**: Create and manage albums that group media by criteria like day, venue, event segment, or photographer.
- **Flexible Filtering**: Provide multiple filter types including time sliders, favorites toggles, face/jersey number search, photographer selection, and album selection.
- **Real-Time Updates**: Filters should update the media grid dynamically without page reloads.

**Key Concepts **

**What is an Album?** An Album is a logical grouping of media assets (photos) within an event. Albums are stored in a new albums table and linked to media via a junction table. 

This supports:

Media belonging to multiple albums.
- Albums spanning multiple days or photographers.
- Automatic album generation based on upload metadata (future e.g., timestamp, photographer).
**What is Media Filtering?**

system for querying media based on user-selected criteria. 

Filters include:

- Time of Participation: A slider for timestamp ranges.
- Album: Radio or checkbox selection from available albums.
- Face/Jersey Search: Text/Selfie input for jersey/player identifiers. 
- Photographer: Selection from credited contributors.
- Filters are composable (AND/OR logic) and persist across sessions if needed.

**How do they relate to Events and Media? **
Events can have N albums.

Albums can reference media from one or more events.

Media records (e.g., media table) gain new metadata fields for better filtering (e.g. media_taken_at. uploaded_by, etc ).

**Media metadata:**
wide760ExifTool Version Number         : 12.40
File Name                       : DSC08551.JPG
Directory                       : .
File Size                       : 9.6 MiB
File Modification Date/Time     : 2025:10:15 09:40:09-04:00
File Access Date/Time           : 2025:10:15 09:40:07-04:00
File Inode Change Date/Time     : 2025:10:15 09:40:09-04:00
File Permissions                : -rw-r--r--
File Type                       : JPEG
File Type Extension             : jpg
MIME Type                       : image/jpeg
JFIF Version                    : 1.01
Resolution Unit                 : inches
X Resolution                    : 350
Y Resolution                    : 350
Image Width                     : 6000
Image Height                    : 4000
Encoding Process                : Baseline DCT, Huffman coding
Bits Per Sample                 : 8
Color Components                : 3
Y Cb Cr Sub Sampling            : YCbCr4:2:2 (2 1)
Image Size                      : 6000x4000
Megapixels                      : 24.0

**Diagram**

[https://www.figma.com/board/VYqqq3W5SbEMcMVYbCUf8y/Swoop-Media-Filtering---Pricing-Logic?node-id=0-1&t=MRyAg27S2KaJb98l-1](https://www.figma.com/board/VYqqq3W5SbEMcMVYbCUf8y/Swoop-Media-Filtering---Pricing-Logic?node-id=0-1&t=MRyAg27S2KaJb98l-1)
