# Global OpenCode instructions

## AI authorship

- Do not add authorship notices to `AGENTS.md` files.
- Credit OpenCode as the author of files and documents it generates entirely. Use the format `Author: OpenCode (<provider>/<model-version>)`, with the actual model ID used to generate the content. If the exact model version is unavailable, say so rather than guessing.
- For a fully AI-generated document, add a byline. For a fully AI-generated source file, use a module docstring, file header comment, or the project's equivalent.
- Keep attribution proportional. Use one notice at the broadest scope it accurately describes: a section in a document, or a docstring or adjacent comment for a generated class, function, or method. Use an inline comment for a few isolated generated lines only when it helps clarify authorship without adding clutter.
- When AI and human contributions are interleaved, prefer a single mixed-authorship note for the enclosing block, section, or file over scattered comments. For example: `Mixed authorship: human contributions and AI assistance from OpenCode (<provider>/<model-version>)`. Do not imply that OpenCode wrote the entire block, and do not repeat attribution already covered by a broader notice.
- Preserve existing author and copyright notices. If a file format does not support comments or author metadata, note the attribution in accompanying documentation rather than altering the format.
