#!/usr/bin/env python3
"""
Convert a Markdown file to a Google Doc (upload to Drive and convert).
Requires: pip install python-docx google-auth-oauthlib google-api-python-client
One-time setup: See scripts/README-gdoc-setup.md for Google Cloud credentials.
Usage: python scripts/md2gdoc.py path/to/file.md
"""
import io
import sys
from pathlib import Path

# Allow importing from same directory when run as script
sys.path.insert(0, str(Path(__file__).resolve().parent))

try:
    from google.auth.transport.requests import Request
    from google.oauth2.credentials import Credentials
    from google_auth_oauthlib.flow import InstalledAppFlow
    from googleapiclient.discovery import build
    from googleapiclient.http import MediaIoBaseUpload
except ImportError:
    print("Missing dependencies. Run once: pip install google-auth-oauthlib google-api-python-client")
    sys.exit(1)

from md2docx import build_document_from_lines

SCOPES = ["https://www.googleapis.com/auth/drive.file"]
SCRIPT_DIR = Path(__file__).resolve().parent
CREDS_DIR = SCRIPT_DIR / ".credentials"
TOKEN_PATH = CREDS_DIR / "token.json"
CLIENT_SECRET_GLOB = "client_secret*.json"


def get_credentials():
    """Load or create OAuth2 credentials for Drive API."""
    CREDS_DIR.mkdir(exist_ok=True)
    creds = None
    if TOKEN_PATH.exists():
        creds = Credentials.from_authorized_user_file(str(TOKEN_PATH), SCOPES)
    if not creds or not creds.valid:
        if creds and creds.expired and creds.refresh_token:
            creds.refresh(Request())
        else:
            secrets = list(CREDS_DIR.glob(CLIENT_SECRET_GLOB))
            if not secrets:
                print("No OAuth client secret found.")
                print("Put your client_secret_*.json from Google Cloud Console into:")
                print(f"  {CREDS_DIR}")
                print("See scripts/README-gdoc-setup.md for one-time setup.")
                sys.exit(1)
            flow = InstalledAppFlow.from_client_secrets_file(str(secrets[0]), SCOPES)
            creds = flow.run_local_server(port=0)
        with open(TOKEN_PATH, "w") as f:
            f.write(creds.to_json())
    return creds


def md_to_gdoc(md_path):
    md_path = Path(md_path).resolve()
    if md_path.suffix.lower() != ".md":
        print("Expected a .md file")
        sys.exit(1)

    with open(md_path, "r", encoding="utf-8") as f:
        lines = f.readlines()
    doc = build_document_from_lines(lines)

    buf = io.BytesIO()
    doc.save(buf)
    buf.seek(0)

    creds = get_credentials()
    service = build("drive", "v3", credentials=creds)

    name = md_path.stem
    file_metadata = {
        "name": name,
        "mimeType": "application/vnd.google-apps.document",
    }
    media = MediaIoBaseUpload(
        buf,
        mimetype="application/vnd.openxmlformats-officedocument.wordprocessingml.document",
        resumable=True,
    )
    created = (
        service.files()
        .create(body=file_metadata, media_body=media, fields="id, name, webViewLink")
        .execute()
    )
    return created.get("webViewLink"), created.get("name")


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python scripts/md2gdoc.py <file.md>")
        sys.exit(1)
    url, name = md_to_gdoc(sys.argv[1])
    print(f"Created Google Doc: {name}")
    print(url)
