# One-time setup: Export Markdown to Google Docs

The script `md2gdoc.py` uploads a generated DOCX to Google Drive and converts it to a Google Doc. You need to create OAuth credentials once.

## Steps

1. **Google Cloud Console**
   - Go to [Google Cloud Console](https://console.cloud.google.com/).
   - Create a project (or pick an existing one).

2. **Enable Drive API**
   - APIs & Services → Library → search “Google Drive API” → Enable.

3. **Create OAuth credentials**
   - APIs & Services → Credentials → Create credentials → OAuth client ID.
   - If prompted, set the OAuth consent screen (External, add your email as test user).
   - Application type: **Desktop app**.
   - Name it (e.g. “MD to Google Doc”), Create.
   - Download the JSON (Download → save the file).

4. **Put the secret in this repo**
   - Create the folder (if it doesn’t exist):
     ```bash
     mkdir -p scripts/.credentials
     ```
   - Move or copy the downloaded JSON into that folder and rename it to `client_secret.json` (or leave the name as-is; the script accepts any `client_secret*.json`).

5. **Run the script**
   - From the repo root:
     ```bash
     .venv/bin/pip install google-auth-oauthlib google-api-python-client
     .venv/bin/python scripts/md2gdoc.py prds/custom-domains.md
     ```
   - The first run opens a browser to sign in with your Google account and authorize the app. A `token.json` is saved in `scripts/.credentials/` so you don’t have to sign in again unless you revoke access or delete the token.

## Security

- `scripts/.credentials/` is gitignored. Do not commit `client_secret*.json` or `token.json`.
- The script only requests `drive.file`, so it can create and manage files it creates, not your whole Drive.
