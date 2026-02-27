---
name: importing-docs
description: Converts documents (.docx, .doc, .pdf, .html, .rtf, Google Docs exports, pasted text) into clean Markdown and places them in the appropriate repo folder. Use when the user says "convert," "import," provides a file to convert, or wants to turn a document into Markdown.
---

# Importing Documents to Markdown

## Prerequisites

Pandoc is required for file-based conversions. If missing, install it:

```bash
brew install pandoc
```

Check with `which pandoc` before proceeding. If the user can't install pandoc, fall back to reading the file content directly and reformatting by hand.

## Workflow

1. **Identify input type** — file path or pasted content.
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

Ask the user to either:
- Export as .docx from Google Docs, then convert as docx.
- Paste the content directly.

### Pasted text

No pandoc needed. Reformat the pasted content directly into clean Markdown:
- Add appropriate heading levels.
- Convert any bullet/numbered lists.
- Format tables if present.
- Preserve links.

## Cleanup rules

After pandoc conversion, fix these common artifacts:

- **Redundant spans**: Remove `\` escape characters before punctuation that don't need escaping.
- **Heading levels**: Ensure a single H1 (the document title). Demote any extra H1s to H2.
- **Blank lines**: Collapse runs of 3+ blank lines down to 2.
- **Link formatting**: Convert reference-style links to inline if there are only a few.
- **Table cleanup**: Ensure tables render correctly. Fix alignment dashes if needed.
- **Image references**: If pandoc extracted images, note their paths. If images can't be preserved, add a placeholder: `[Image: description]`.

## Applying the import template

Read `templates/import.md` and fill in:

- **Document Title**: Infer from the first heading or filename.
- **Source**: The original file path, URL, or "pasted by user."
- **Format**: One of `docx`, `pdf`, `html`, `rtf`, `gdoc`, `pasted`.
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
