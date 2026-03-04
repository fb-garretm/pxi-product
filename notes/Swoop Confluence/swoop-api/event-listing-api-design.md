# Event Listing API Design

| Field | Value |
|-------|-------|
| Source | https://fastbreak.atlassian.net/wiki/spaces/ASPAD/pages/985071617 |
| Format | confluence |
| Imported | 2025-03-03 |

---

**POST /events/search?page=1&pageSize=20**
jsonwide760{ 
	"name": "summer classic", 
	"organizer": "city sports", 
	"sport": "basketball", 
	"sportType": "pickup", 
	"city": "Chicago", 
	"zipCode": "60601", 
	"startDate": "2026-02-10", 
	"endDate": "2026-03-10", 
	"...more filters": "..." 
}
Why?

- Server-side filtering, before pagination

- 
Client only ever receives a small, already-narrowed set of results
- The server filters first, then paginates the filtered set, so every page the user sees is relevant and consistent.
- POST over GET because of the amount of filters we have

- 
URL will get too long
- Filters all driven through this JSON object
- Pagination params as query params just to create separation
Need endpoints for the drop down suggestions, because the data is still server-side

- Query params for what the user enters
- 
**GET /events/suggestions

- 
List of events based on whats available in the event data
- Nearby events allows us to filter based on event location
**GET /locations/suggestions**
- List of locations based on whats available in the event data
**GET /sports/suggestions**
- List of sports based on whats actually available in the event data
**Event Organizers**

- GET /events/organizers
- Get organizers that have active events
Note: All these event sections are conditional

**This Weekend Section**

- Could be driven off the same events endpoint, just filtered to this weekends dates
**Upcoming Events**

- All events happening within the next 30 days
**Past Events**

- Events that have happened within the past 30 days
**Trending Cities**

- GET /locations/trending
- Probably it's own endpoint
**Other Events You May Be Interested In**

- Events that almost matched your search criteria

Close to the location, 
## Event Details Page

GET /events/eventID
Event Details by ID

- Event name, price, organizer, sports
- Event description, location, dates, divisions, cost
- Contact info
- ==FAQs?==
GET /events/eventID/divisions

GET /events/eventID/schedule

GET /events/eventID/venue
