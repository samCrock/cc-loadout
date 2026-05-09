# GitNexus — DevTools Reference

## URL
https://github.com/abhigyanpatwari/GitNexus

## Description
Zero-server code intelligence engine. Browser-based knowledge graph creator from GitHub repos with built-in Graph RAG Agent.

## Install

```bash
npm install -g gitnexus
# Faster install (no C++ toolchain):
GITNEXUS_SKIP_OPTIONAL_GRAMMARS=1 npm install -g gitnexus
```

## Commands

| Command | Purpose |
|---------|---------|
| `gitnexus analyze --skills` | Auto-generate SKILL.md per codebase area |
| `gitnexus wiki` | Generate module documentation with cross-refs |
| `npx gitnexus@latest serve` | Start backend server |

## Key Features

- Browser-based, runs entirely client-side
- Drop GitHub repo URL or ZIP → interactive knowledge graph
- Leiden community detection for functional area discovery
- Built-in Graph RAG Agent for codebase Q&A
- Dynamic SKILL.md generation per module

## Skills Integration

Run `gitnexus analyze --skills` to populate `.claude/skills/generated/` with targeted skills.