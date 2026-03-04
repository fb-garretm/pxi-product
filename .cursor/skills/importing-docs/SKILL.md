---
name: importing-docs
description: Converts documents (.docx, .doc, .pdf, .html, .rtf, Google Docs exports, pasted text, Confluence pages) into clean Markdown and places them in the appropriate repo folder. Use when the user says "convert," "import," "import from Google Docs," "import from Confluence," "sync Confluence," "pull latest from Confluence," provides a file, Google Docs URL, or Confluence URL to convert, or wants to turn a document into Markdown.
---

# Importing Documents to Markdown

## Prerequisites

Pandoc is required for file-based conversions. If missing, install it:

```bash
brew install pandoc
```

Check with `which pandoc` before proceeding. If the user can't install pandoc, fall back to reading the file content directly and reformatting by hand.

**jq** is required for Confluence imports (extracts HTML from API JSON responses). If missing:

```bash
brew install jq
```

## Workflow

1. **Identify input type** — file path, pasted content, or Confluence URL.
2. **Convert to Markdown** using the appropriate method (see below).
3. **Clean up** pandoc artifacts.
4. **Wrap in import template** — read `templates/import.md` and fill in the metadata fields.
5. **Detect destination folder** — suggest a folder based on content, confirm with user.
6. **Save** with a kebab-case filename.

## Conversion by format

### docx / doc / rtf

```bash
pandoc -f docx -t markdown --wrap=none "input.docx" -o "output.md"
```

Replace `-f docx` with `-f rtf` for RTF files.

### HTML

```bash
pandoc -f html -t markdown --wrap=none "input.html" -o "output.md"
```

### PDF

```bash
pandoc -f pdf -t markdown --wrap=none "input.pdf" -o "output.md"
```

Pandoc works if the PDF has selectable text. For scanned/image PDFs, tell the user pandoc can't extract text and ask them to paste the content instead.

### Google Docs

Support two ways to get content from Google Docs into Markdown.

**Option A — Export as .docx (recommended)**

1. In Google Docs, open the document.
2. **File → Download → Microsoft Word (.docx)**.
3. Save the file locally and tell the agent the path (e.g. `~/Downloads/Product Requirements.docx`), or drag the file into the workspace.
4. Convert using the **docx** flow above: `pandoc -f docx -t markdown --wrap=none "input.docx" -o "output.md"`.
5. Use **Format** `gdoc` in the import template and set **Source** to the Google Doc URL if the user has it (e.g. `https://docs.google.com/document/d/ABC123.../edit`), or "Exported from Google Docs (docx)".

**Option B — Paste the content**

If the user can't export (e.g. view-only, or they prefer not to download):

- Ask them to select all (Cmd+A / Ctrl+A), copy, and paste the content into the chat.
- Reformat the pasted content into clean Markdown (headings, lists, tables, links). Use **Format** `gdoc` and **Source** "Pasted from Google Docs".

**Option C — Import by URL (link-shareable docs only)**

If the user provides a Google Docs URL and the doc is shared so **Anyone with the link can view**:

1. Extract the document ID from the URL: `https://docs.google.com/document/d/{DOC_ID}/edit` → `DOC_ID`.
2. Try to download the Word export:  
   `https://docs.google.com/document/d/{DOC_ID}/export?format=docx`  
   Use `curl -L -o "downloaded.docx" "URL"` (follow redirects).
3. **Detect whether the export succeeded** (see below). If the response is HTML (login or permission interstitial), the doc is not publicly exportable — fall back to Option A or B and tell the user what was detected.
4. If a real .docx was downloaded, convert with pandoc as in Option A, then apply cleanup and the import template. Set **Source** to the Google Doc URL.

**Detecting login / permission interstitials**

Google often returns HTML instead of a .docx when the request is unauthenticated or has no cookies. Check the download:

- **Is it a real .docx?** Run `file downloaded.docx`. A real export is `Microsoft Word 2007+` or `Zip archive` (docx is ZIP). If `file` reports `HTML document, ASCII text`, the export failed.
- **What kind of interstitial?** If it’s HTML, inspect the first few KB (`head -c 4000 downloaded.docx`). Google’s interstitial page typically contains:
  - **Login required:** `show-login-page`, `sign-in-button`, `document-root` — user must sign in in a browser; export by URL won’t work without browser cookies. Tell the user: “Google returned a sign-in page; use Option A (export .docx) or Option B (paste).”
  - **Storage access / cookies:** `request-storage-access`, `storage_access_granted` — Google is asking for cookie/storage access (e.g. in a cross-site context). Same outcome: use Option A or B.

So: if `file` says HTML, treat it as “login or permission required” and direct the user to export as .docx or paste. Only proceed with pandoc when the downloaded file is actually a Word/ZIP document.

**Screenshots and images in the doc**

- **Option A (export .docx):** The .docx includes embedded images. When you run pandoc, it extracts them (typically into a `media/` or similarly named folder next to the output .md). After conversion:
  - Keep the extracted image files. Move them into a single folder next to the final markdown file, e.g. `{document-slug}-assets/` (e.g. `product-requirements-assets/`) so the repo has one place per doc for screenshots.
  - Update image paths in the .md so they point at that folder, e.g. `![](product-requirements-assets/image1.png)`. Use relative paths from the .md file.
  - If the doc has many screenshots, tell the user where the assets folder is and that they can rename images for clarity.
- **Option B (paste):** Images usually do **not** come through when pasting from Google Docs into chat. If the user mentions screenshots:
  - Add placeholders in the markdown where images belong: `[Image: short description]` or `[Screenshot: description].`
  - Ask the user to export the doc as .docx (Option A) if they need screenshots preserved, or to add image files later (e.g. drag into the repo and share paths so you can insert proper `![](...)` links).
- **Option C (URL):** Same as Option A — if we get a real .docx, pandoc will extract images; keep the media folder and fix paths as above.

### Pasted text

No pandoc needed. Reformat the pasted content directly into clean Markdown:
- Add appropriate heading levels.
- Convert any bullet/numbered lists.
- Format tables if present.
- Preserve links.

### Confluence

Fetches a Confluence page via REST API and converts to Markdown. Requires `pandoc`, `jq`, and `curl`.

#### Authentication setup (one-time)

Check for environment variables first. If any are missing, walk the user through setup:

**Confluence Cloud** (URLs contain `*.atlassian.net`):

- `CONFLUENCE_BASE_URL` — e.g. `https://yourteam.atlassian.net/wiki`
- `CONFLUENCE_EMAIL` — the user's Atlassian account email
- `CONFLUENCE_API_TOKEN` — generated at https://id.atlassian.com/manage-profile/security/api-tokens

**Confluence Data Center / Server** (self-hosted URLs):

- `CONFLUENCE_BASE_URL` — e.g. `https://confluence.yourcompany.com`
- `CONFLUENCE_PAT` — Personal Access Token, generated in Confluence under Profile > Personal Access Tokens

Suggest the user add these to `~/.zshrc` so they persist:

```bash
export CONFLUENCE_BASE_URL="https://yourteam.atlassian.net/wiki"
export CONFLUENCE_EMAIL="you@company.com"
export CONFLUENCE_API_TOKEN="your-token-here"
```

After the user updates their shell profile, run `source ~/.zshrc` to load the variables into the current session.

#### Parsing the URL

Extract the **page ID** from the Confluence URL. Common formats:

| URL pattern | How to extract page ID |
|---|---|
| `https://domain.atlassian.net/wiki/spaces/SPACE/pages/123456/Page+Title` | The numeric segment after `/pages/` (`123456`) |
| `https://confluence.example.com/display/SPACE/Page+Title` | Page ID is not in the URL — resolve it via API (see below) |
| `https://confluence.example.com/pages/viewpage.action?pageId=123456` | The `pageId` query parameter (`123456`) |

**Resolving a page ID from a `/display/` URL:**

```bash
SPACE="SPACE_KEY"
TITLE="Page+Title"  # URL-encoded title from the URL path
curl -s -H "Authorization: Bearer $CONFLUENCE_PAT" \
  "$CONFLUENCE_BASE_URL/rest/api/content?spaceKey=$SPACE&title=$TITLE" \
  | jq -r '.results[0].id'
```

#### Fetching and converting

Once you have the page ID, fetch the page content and convert it:

**Cloud auth** (Basic auth with email + API token):

```bash
PAGE_ID="123456"
curl -s -u "$CONFLUENCE_EMAIL:$CONFLUENCE_API_TOKEN" \
  "$CONFLUENCE_BASE_URL/rest/api/content/$PAGE_ID?expand=body.storage,version,space" \
  | jq -r '.body.storage.value' \
  | pandoc -f html -t markdown --wrap=none -o "output.md"
```

**Data Center auth** (Bearer token):

```bash
PAGE_ID="123456"
curl -s -H "Authorization: Bearer $CONFLUENCE_PAT" \
  "$CONFLUENCE_BASE_URL/rest/api/content/$PAGE_ID?expand=body.storage,version,space" \
  | jq -r '.body.storage.value' \
  | pandoc -f html -t markdown --wrap=none -o "output.md"
```

To also capture the page title for the import template metadata:

```bash
curl -s -u "$CONFLUENCE_EMAIL:$CONFLUENCE_API_TOKEN" \
  "$CONFLUENCE_BASE_URL/rest/api/content/$PAGE_ID?expand=body.storage" \
  | jq -r '.title'
```

After conversion, read the resulting `output.md`, apply cleanup (including Confluence-specific rules below), wrap in the import template, and delete the temporary file.

#### Syncing a Confluence folder (manual sync)

When the user says **"sync Confluence," "pull latest from Confluence," "sync Confluence folder,"** or similar:

1. **Read the sync config** at `.cursor/confluence-sync.json`. It may contain:
   - **`parentFolder`** (optional): A single parent Confluence folder whose children are month-named folders (January, February, March, …). Use this for standup-style sync (see step 3 below).
   - **`folders`**: Array of individual folder entries, each with `folderId`, `path`, optional `label`, optional `onlyAfterFebruary`.
2. **Decide scope:** If the user names a specific folder or month, sync only that; otherwise sync using the config (parent and/or folders).
3. **Parent folder with month subfolders** (when `parentFolder` is present and its `folderId` is set):
   - The parent's child pages are **month folders** (titles like "January", "February", "March", …). Each has its own child pages (the standup documents).
   - Map month name to **yyyy-mm** using `parentFolder.year` (or current year): January→01, February→02, March→03, April→04, May→05, June→06, July→07, August→08, September→09, October→10, November→11, December→12. Match case-insensitively ("Jan", "February", "Mar", etc.).
   - When `onlyAfterFebruary` is true, **only sync month folders March or later**. Skip January and February. For each March-onward month, list its child pages, then for each page: fetch, convert, apply cleanup and import template, save as `{parentFolder.path}/{YYYY-MM}/{kebab-case-title}.md` (e.g. `notes/garret/2026-03/standup-notes-march-2-6.md`). Create `{path}/{YYYY-MM}` as needed.
   - **Do not touch other files:** Only create or overwrite files that correspond to Confluence pages you synced. Do not delete or overwrite any other files in `notes/garret` or in any `notes/garret/YYYY-MM` folder. If a page was removed in Confluence, leave the local file as-is unless the user asks to remove it.
4. **Flat folder sync** (for each entry in `folders`):
   - Ensure the destination directory exists: `mkdir -p <path>`.
   - List child pages: `GET /rest/api/content/{folderId}/child/page?limit=50` (Cloud: `curl -s -u "$CONFLUENCE_EMAIL:$CONFLUENCE_API_TOKEN" "$CONFLUENCE_BASE_URL/rest/api/content/{folderId}/child/page?limit=50"`).
   - From the response, get each page `id` and `title` (e.g. `jq -r '.results[] | "\(.id)|\(.title)"'`).
   - **Filter by month (if `onlyAfterFebruary` is true):** Only process pages whose title suggests March or later; skip January/February (see step 6).
   - For each remaining page: fetch, convert, apply cleanup and import template, save as `{path}/{kebab-case-title}.md`. Do not delete or overwrite other files in `path` that are not in the Confluence child list.
5. **Filter by month (onlyAfterFebruary):** "After February" = title contains any of: `Mar`, `March`, `Apr`, `April`, `May`, `Jun`, `June`, `Jul`, `July`, `Aug`, `Sep`, `Sept`, `Oct`, `Nov`, `Dec` or `YYYY-03` … `YYYY-12`. **Skip** if title contains `Jan`, `January`, `Feb`, `February`, `YYYY-01`, `YYYY-02`.
6. **Confirm** with the user which folders/months were synced and how many files were updated or created.

To **set the parent folder:** Set `parentFolder.folderId` in `.cursor/confluence-sync.json` to the numeric ID from the Confluence parent folder URL (e.g. `.../folder/123456` → `123456`). Set `parentFolder.path` to the standup base path (e.g. `notes/garret`). Set `parentFolder.year` for yyyy-mm (e.g. `2026`).

To **add a flat folder**, append to `folders`: `{ "folderId": "<id>", "path": "notes/garret/YYYY-MM", "label": "Short description" }`.

## Cleanup rules

After pandoc conversion, fix these common artifacts:

- **Redundant spans**: Remove `\` escape characters before punctuation that don't need escaping.
- **Heading levels**: Ensure a single H1 (the document title). Demote any extra H1s to H2.
- **Blank lines**: Collapse runs of 3+ blank lines down to 2.
- **Link formatting**: Convert reference-style links to inline if there are only a few.
- **Table cleanup**: Ensure tables render correctly. Fix alignment dashes if needed.
- **Image references**: If pandoc extracted images from a docx (e.g. Google Docs export), keep the extracted files and fix paths in the markdown so they point to a single assets folder next to the .md (e.g. `doc-name-assets/image1.png`). If images were lost (e.g. pasted content) or couldn't be extracted, add a placeholder where each image belonged: `[Image: description]` or `[Screenshot: description]`.

### Confluence-specific cleanup

Confluence storage format produces extra artifacts beyond standard pandoc issues. After the general cleanup above, also fix:

- **`ac:` macro tags**: Remove or convert Confluence macros (`ac:structured-macro`, `ac:parameter`, `ac:rich-text-body`, etc.). These typically survive pandoc conversion as raw HTML fragments. Strip them entirely or convert to plain Markdown equivalents:
  - `ac:structured-macro ac:name="info"` / `"note"` / `"warning"` / `"tip"` — convert to a blockquote with a bold label, e.g. `> **Note:** content here`.
  - `ac:structured-macro ac:name="code"` — convert to a fenced code block.
  - `ac:structured-macro ac:name="toc"` — remove entirely (table of contents is auto-generated in Markdown viewers).
  - `ac:structured-macro ac:name="expand"` — unwrap the content, discard the expand/collapse wrapper.
  - Other macros — remove the macro tags, keep inner text content if present.
- **`ri:` resource identifiers**: Strip `ri:attachment`, `ri:page`, `ri:space` tags. Convert `ri:page` links to plain text references.
- **Status labels**: Confluence `ac:structured-macro ac:name="status"` renders as colored status lozenges. Convert to bold inline text: `**STATUS_TEXT**`.
- **Layout markup**: Remove `ac:layout`, `ac:layout-section`, `ac:layout-cell` tags. Keep the cell content as sequential sections.
- **Emoticons**: Replace `ac:emoticon` tags with the closest Unicode emoji or remove if no match.
- **User mentions**: `ri:user` tags with `ri:userkey` — replace with the user's display name in plain text, prefixed with `@` if available.
- **Confluence links**: `ac:link` wrapping `ri:page` — convert to a plain Markdown link pointing to the Confluence page URL, or just use the page title as plain text if the link can't be resolved.
- **Empty divs and spans**: Remove leftover empty `<div>`, `<span>`, and Confluence-specific wrapper elements that pandoc didn't clean up.

## Applying the import template

Read `templates/import.md` and fill in:

- **Document Title**: Infer from the first heading or filename.
- **Source**: The original file path, URL, or "pasted by user."
- **Format**: One of `docx`, `pdf`, `html`, `rtf`, `gdoc`, `confluence`, `pasted`.
- **Imported**: Today's date in YYYY-MM-DD format.

Place the converted content below the `---` separator.

## AI-readable layer (use your judgment)

After placing the converted content, decide whether the document would benefit from a **Summary** and **Key Points** section inserted between the metadata table and the full content. Add them when:

- The document is long (roughly 1+ pages of content).
- Key takeaways are buried in prose or scattered across sections.
- The document covers multiple topics or decisions.
- Other agents or skills would likely reference this doc (e.g., strategy docs, research, dense meeting notes).

Skip them when:

- The content is already short and scannable.
- The document is a simple list, checklist, or single-topic note.
- Adding a summary would just repeat the content.

When adding them, insert after the `---` and before the full content:

```markdown
## Summary

_2-3 sentences: what this document is about and why it matters._

## Key Points

- _Extracted takeaways, decisions, or findings as bullets_
```

Then place the full converted content under a `## Full Content` heading.

## Folder detection

Scan the converted content and suggest a destination:

| Content signals | Suggested folder |
|-----------------|------------------|
| Requirements, priorities, ship dates, scope | `prds/` |
| Research, findings, hypotheses, competitive analysis | `discovery/` |
| Meeting notes, general notes, action items | `notes/` |
| Product overviews, feature descriptions, specs | `products/` |
| Roadmap, vision, strategic planning, OKRs | `strategy/` |

Always confirm the folder with the user before saving. If the content doesn't clearly match any folder, ask.

## File naming

- Lowercase kebab-case: `quarterly-planning-notes.md`, `competitor-analysis.md`.
- Derive from the document title or ask the user.
