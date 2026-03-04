# API Endpoint Examples: /api/media/exif/search

| Field | Value |
|-------|-------|
| Source | https://fastbreak.atlassian.net/wiki/spaces/ASPAD/pages/697466881 |
| Format | confluence |
| Imported | 2025-03-03 |

---

Example 1: Capture Time Only Search

  Request:
  curl -X POST [https://your-domain.com/api/media/exif/search](https://your-domain.com/api/media/exif/search) \
    -H &quot;Content-Type: application/json&quot; \
    -H &quot;Authorization: Bearer YOUR_JWT_TOKEN&quot; \
    -d '{
      &quot;eventId&quot;: 670,
      &quot;captureTimeRange&quot;: {
        &quot;start&quot;: &quot;2025-06-01T00:00:00Z&quot;,
        &quot;end&quot;: &quot;2025-06-30T23:59:59Z&quot;
      },
      &quot;limit&quot;: 50,
      &quot;offset&quot;: 0
    }'

  Response (200 OK):
  {
    &quot;mediaIds&quot;: [33982, 33981, 33980, 33979, 33978],
    &quot;total&quot;: 5,
    &quot;hasMore&quot;: false
  }

  What it does:

- Searches for photos captured in June 2025
- Returns first 50 results (all 5 photos found)
- hasMore: false means no additional pages
  Example 2: Bounding Box Location Search

  Request:
  curl -X POST [https://your-domain.com/api/media/exif/search](https://your-domain.com/api/media/exif/search) \
    -H &quot;Content-Type: application/json&quot; \
    -H &quot;Authorization: Bearer YOUR_JWT_TOKEN&quot; \
    -d '{
      &quot;eventId&quot;: 670,
      &quot;location&quot;: {
        &quot;type&quot;: &quot;bbox&quot;,
        &quot;bbox&quot;: {
          &quot;minLat&quot;: 37.7,
          &quot;maxLat&quot;: 37.8,
          &quot;minLng&quot;: -122.5,
          &quot;maxLng&quot;: -122.4
        }
      },
      &quot;limit&quot;: 100,
      &quot;offset&quot;: 0
    }'

  Response (200 OK):
  {
    &quot;mediaIds&quot;: [34102, 34101, 34100],
    &quot;total&quot;: 3,
    &quot;hasMore&quot;: false
  }

  What it does:

- Searches within a rectangular area (San Francisco)
- Returns photos with GPS coordinates in that bounding box
- Currently returns 0 for event 670 (no GPS data exists)
  Example 3: Radius Search (5km radius)

  Request:
  curl -X POST [https://your-domain.com/api/media/exif/search](https://your-domain.com/api/media/exif/search) \
    -H &quot;Content-Type: application/json&quot; \
    -H &quot;Authorization: Bearer YOUR_JWT_TOKEN&quot; \
    -d '{
      &quot;eventId&quot;: 670,
      &quot;location&quot;: {
        &quot;type&quot;: &quot;radius&quot;,
        &quot;radius&quot;: {
          &quot;centerLat&quot;: 37.7749,
          &quot;centerLng&quot;: -122.4194,
          &quot;distanceMeters&quot;: 5000
        }
      },
      &quot;limit&quot;: 100,
      &quot;offset&quot;: 0
    }'

  Response (200 OK):
  {
    &quot;mediaIds&quot;: [34052, 34051, 34050],
    &quot;total&quot;: 3,
    &quot;hasMore&quot;: false
  }

  What it does:

- Searches within 5km radius of center point (Golden Gate Bridge)
- Uses Haversine formula for accurate distance calculation
- First fetches bounding box candidates, then filters by exact distance
- Returns only photos within the radius
  Example 4: Combined Capture Time + Location Search

  Request:
  curl -X POST [https://your-domain.com/api/media/exif/search](https://your-domain.com/api/media/exif/search) \
    -H &quot;Content-Type: application/json&quot; \
    -H &quot;Authorization: Bearer YOUR_JWT_TOKEN&quot; \
    -d '{
      &quot;eventId&quot;: 670,
      &quot;captureTimeRange&quot;: {
        &quot;start&quot;: &quot;2025-06-15T14:00:00Z&quot;,
        &quot;end&quot;: &quot;2025-06-15T18:00:00Z&quot;
      },
      &quot;location&quot;: {
        &quot;type&quot;: &quot;radius&quot;,
        &quot;radius&quot;: {
          &quot;centerLat&quot;: 37.7749,
          &quot;centerLng&quot;: -122.4194,
          &quot;distanceMeters&quot;: 10000
        }
      },
      &quot;limit&quot;: 50,
      &quot;offset&quot;: 0
    }'

  Response (200 OK):
  {
    &quot;mediaIds&quot;: [34012, 34011],
    &quot;total&quot;: 2,
    &quot;hasMore&quot;: false
  }

  What it does:

- Finds photos taken on June 15, 2025 between 2:00 PM - 6:00 PM UTC
- AND within 10km of Golden Gate Bridge
- Combines both EXIF filters for precise search
  Example 5: Pagination (Large Result Set)

  Request - Page 1:
  curl -X POST [https://your-domain.com/api/media/exif/search](https://your-domain.com/api/media/exif/search) \
    -H &quot;Content-Type: application/json&quot; \
    -H &quot;Authorization: Bearer YOUR_JWT_TOKEN&quot; \
    -d '{
      &quot;eventId&quot;: 670,
      &quot;captureTimeRange&quot;: {
        &quot;start&quot;: &quot;2025-06-01T00:00:00Z&quot;,
        &quot;end&quot;: &quot;2025-06-30T23:59:59Z&quot;
      },
      &quot;limit&quot;: 100,
      &quot;offset&quot;: 0
    }'

  Response:
  {
    &quot;mediaIds&quot;: [34100, 34099, 34098, ..., 34001],
    &quot;total&quot;: 250,
    &quot;hasMore&quot;: true
  }

  Request - Page 2:
  curl -X POST [https://your-domain.com/api/media/exif/search](https://your-domain.com/api/media/exif/search) \
    -H &quot;Content-Type: application/json&quot; \
    -H &quot;Authorization: Bearer YOUR_JWT_TOKEN&quot; \
    -d '{
      &quot;eventId&quot;: 670,
      &quot;captureTimeRange&quot;: {
        &quot;start&quot;: &quot;2025-06-01T00:00:00Z&quot;,
        &quot;end&quot;: &quot;2025-06-30T23:59:59Z&quot;
      },
      &quot;limit&quot;: 100,
      &quot;offset&quot;: 100
    }'

  Response:
  {
    &quot;mediaIds&quot;: [34000, 33999, 33998, ..., 33901],
    &quot;total&quot;: 250,
    &quot;hasMore&quot;: true
  }

  What it does:

- Page 1: Returns IDs 34100-34001 (100 photos)
- hasMore: true indicates more results available
- Page 2: Returns IDs 34000-33901 with offset=100
- Continue pagination until hasMore: false
  Error Examples

  Missing Required Field (400 Bad Request)

  Request:
  curl -X POST [https://your-domain.com/api/media/exif/search](https://your-domain.com/api/media/exif/search) \
    -H &quot;Content-Type: application/json&quot; \
    -H &quot;Authorization: Bearer YOUR_JWT_TOKEN&quot; \
    -d '{
      &quot;captureTimeRange&quot;: {
        &quot;start&quot;: &quot;2025-06-01T00:00:00Z&quot;,
        &quot;end&quot;: &quot;2025-06-30T23:59:59Z&quot;
      }
    }'

  Response (400 Bad Request):
  {
    &quot;type&quot;: &quot;validation_error&quot;,
    &quot;status&quot;: 400,
    &quot;title&quot;: &quot;Validation Error&quot;,
    &quot;detail&quot;: &quot;eventId is required and must be a number&quot;
  }

  Invalid Coordinates (400 Bad Request)

  Request:
  curl -X POST [https://your-domain.com/api/media/exif/search](https://your-domain.com/api/media/exif/search) \
    -H &quot;Content-Type: application/json&quot; \
    -H &quot;Authorization: Bearer YOUR_JWT_TOKEN&quot; \
    -d '{
      &quot;eventId&quot;: 670,
      &quot;location&quot;: {
        &quot;type&quot;: &quot;bbox&quot;,
        &quot;bbox&quot;: {
          &quot;minLat&quot;: 95,
          &quot;maxLat&quot;: 120,
          &quot;minLng&quot;: -122.5,
          &quot;maxLng&quot;: -122.4
        }
      }
    }'

  Response (400 Bad Request):
  {
    &quot;type&quot;: &quot;validation_error&quot;,
    &quot;status&quot;: 400,
    &quot;title&quot;: &quot;Validation Error&quot;,
    &quot;detail&quot;: &quot;Invalid latitude values (must be between -90 and 90)&quot;
  }

  Invalid Date Range (400 Bad Request)

  Request:
  curl -X POST [https://your-domain.com/api/media/exif/search](https://your-domain.com/api/media/exif/search) \
    -H &quot;Content-Type: application/json&quot; \
    -H &quot;Authorization: Bearer YOUR_JWT_TOKEN&quot; \
    -d '{
      &quot;eventId&quot;: 670,
      &quot;captureTimeRange&quot;: {
        &quot;start&quot;: &quot;2025-06-30T00:00:00Z&quot;,
        &quot;end&quot;: &quot;2025-06-01T00:00:00Z&quot;
      }
    }'

  Response (400 Bad Request):
  {
    &quot;type&quot;: &quot;validation_error&quot;,
    &quot;status&quot;: 400,
    &quot;title&quot;: &quot;Validation Error&quot;,
    &quot;detail&quot;: &quot;captureTimeRange.start must be <= captureTimeRange.end&quot;
  }

  Radius Too Large (400 Bad Request)

  Request:
  curl -X POST [https://your-domain.com/api/media/exif/search](https://your-domain.com/api/media/exif/search) \
    -H &quot;Content-Type: application/json&quot; \
    -H &quot;Authorization: Bearer YOUR_JWT_TOKEN&quot; \
    -d '{
      &quot;eventId&quot;: 670,
      &quot;location&quot;: {
        &quot;type&quot;: &quot;radius&quot;,
        &quot;radius&quot;: {
          &quot;centerLat&quot;: 37.7749,
          &quot;centerLng&quot;: -122.4194,
          &quot;distanceMeters&quot;: 100000
        }
      }
    }'

  Response (400 Bad Request):
  {
    &quot;type&quot;: &quot;validation_error&quot;,
    &quot;status&quot;: 400,
    &quot;title&quot;: &quot;Validation Error&quot;,
    &quot;detail&quot;: &quot;distanceMeters must be between 1 and 50000&quot;
  }

  Unauthorized (401 Unauthorized)

  Request (missing auth header):
  curl -X POST [https://your-domain.com/api/media/exif/search](https://your-domain.com/api/media/exif/search) \
    -H &quot;Content-Type: application/json&quot; \
    -d '{
      &quot;eventId&quot;: 670,
      &quot;captureTimeRange&quot;: {
        &quot;start&quot;: &quot;2025-06-01T00:00:00Z&quot;,
        &quot;end&quot;: &quot;2025-06-30T23:59:59Z&quot;
      }
    }'

  Response (401 Unauthorized):
  {
    &quot;type&quot;: &quot;authentication_error&quot;,
    &quot;status&quot;: 401,
    &quot;title&quot;: &quot;Unauthorized&quot;,
    &quot;detail&quot;: &quot;Authentication required&quot;
  }

  Rate Limit Exceeded (429 Too Many Requests)

  Response (after 10,000 requests in 60 seconds):
  {
    &quot;error&quot;: &quot;Rate limit exceeded&quot;
  }
