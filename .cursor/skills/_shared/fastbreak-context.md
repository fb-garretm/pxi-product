# Fastbreak AI — Product Context

This file is shared context for all board review agents. Read it before reviewing any document.

## Company

**Fastbreak AI** is a youth and amateur sports technology platform. It provides tournament and league management, club operations, registration, scheduling, communication, and white-label apps for sports organizations.

## PXI Product Suite

PXI is the consumer and operator-facing product portfolio within Fastbreak AI.

| Product | What it does |
|---------|-------------|
| **Fastbreak App (Swoop)** | Mobile app for parents, athletes, coaches, and club admins. Schedules, messaging, photos, team management. Eventually tournament operators. |
| **Club Platform** | Centralized club operations: seasons, programs, registration, rosters, payments, compliance. The operational hub that other products connect to. |
| **Custom Apps** | White-label mobile apps for sports organizations. Org-branded, built on shared infrastructure. |
| **Compete** | Registration, schedules, seeding, brackets, results engine. Powers the competitive event layer. |
| **OSS (Operator Standard Site)** | Template websites for tournament operators at {org-slug}.sites.fastbreak.ai. Discovery and information layer. |
| **Travel** | Club travel logistics tied to events and team schedules. |
| **Billing** | Unified payments, invoicing, and financial tracking across programs, seasons, teams, and households. |

These products share data and infrastructure. Club is the operational hub — it manages organizations, teams, rosters, and eligibility that feed into Compete, the Fastbreak App, Travel, and Billing.

## Target Users

| User | Context |
|------|---------|
| **Tournament / League Operators** | Run events, manage brackets, communicate with participants. Time-pressed on event day. Staff ranges from tech-savvy directors to 60-year-old volunteer coordinators. |
| **Club Admins** | Manage multi-team, multi-season organizations. Need operational efficiency, visibility, and compliance tracking. |
| **Coaches** | Manage rosters, schedules, attendance. Communicate with parents and athletes. Need speed — 30 seconds between games. Bad WiFi at venues is common. |
| **Parents / Guardians** | Manage logistics for one or more children across multiple sports. Need schedule reliability, payment clarity, and communication with coaches/organizers. Quick to abandon tools that add friction. |
| **Athletes** | Primarily youth (ages ~10-18). Want social connection, team engagement, stats. Low patience for complexity. Judge apps instantly. COPPA considerations apply for under-13. |

## Key Technical Context

- **API-first architecture**: All applications consume APIs exclusively — no direct database access.
- **Supabase**: Backend infrastructure with Row Level Security (RLS) for data access control.
- **Universal Login**: Shared authentication across all Fastbreak products.
- **Platform convergence**: Products are moving toward shared primitives and reusable infrastructure, away from siloed implementations.

## Key Constraints

- **COPPA**: Athletes include minors under 13. Data collection, consent, and privacy require parental consent mechanisms.
- **Offline/low-connectivity**: Tournament venues frequently have poor WiFi. Features that require constant connectivity will fail in the field.
- **Multi-child households**: Parents often manage 2-4 children across different teams, sports, and organizations. Single-child assumptions break the experience.
- **Day-of-event urgency**: Schedule changes, weather delays, and bracket updates need to reach participants in seconds, not minutes.
- **Diverse tech literacy**: Users range from social-media-native teenagers to volunteers who struggle with smartphones.
